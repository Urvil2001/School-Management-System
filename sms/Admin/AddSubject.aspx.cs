using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_AddSubject : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        notpostback();
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "select count(subjectid) from Subject where stdid='" + DropDownList1.Text + "' and subjectname='" + ComboBox1.Text + "'";
        cmd3.Connection = con;
        int countsubject = Convert.ToInt16(cmd3.ExecuteScalar());
        if (countsubject > 0)
        {
            Response.Write("<script>alert('Subject Already Added..')</script>");
        }
        else
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "insert into Subject values('" + ComboBox1.SelectedItem.Text + "'," + DropDownList1.SelectedItem.Value + ") ";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Subject Added..')</script>");
            notpostback();

        }

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME = 'Result' AND COLUMN_NAME = '" + ComboBox1.Text + "' ) BEGIN ALTER TABLE dbo.Result ADD " + ComboBox1.Text + " varchar(15) END";

        cmd2.Connection = con;
        cmd2.ExecuteNonQuery();
      
    }

    private DataTable GetData()
    {
        
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Subject";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();


        sda.SelectCommand = cmd;
        DataTable dt = new DataTable();

        sda.Fill(dt);
        return dt;


    }
    public void notpostback()
    {
        SqlCommand cmd = new SqlCommand();
        
        cmd.CommandText = "select subjectname as Subject,stdid as Standard from Subject ORDER BY stdid";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        
    }
    protected void GridView2_PageIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView2_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        notpostback();
    }
}