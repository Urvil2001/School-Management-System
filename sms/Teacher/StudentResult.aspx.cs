using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Teacher_StudentResult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select * from Student where div='"+Convert.ToString(Session["div"])+"' and std='"+Session["std"]+"'";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        r1.DataSource = dt;
        r1.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        
        cmd.CommandText = "update Result SET status='yes' where std='" + Session["std"] + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand();
        string des="Your result has been declare,Please All student/Parents check your Result...";
        cmd2.CommandText = "insert into Announcement values('" + des + "','" + Session["std"] + "','no')";
        cmd2.Connection = con;
        cmd2.ExecuteNonQuery();
    }
}