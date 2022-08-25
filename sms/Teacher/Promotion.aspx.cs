using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Teacher_Promotion : System.Web.UI.Page
{
    int std;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select std from Student where Enrollmentno='" + Request.QueryString["id"].ToString() + "' ";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            std =Convert.ToInt16(ds.Tables[0].Rows[0]["std"].ToString());
        }
        std=std+1;

        if (std > 12)
        {
            Response.Redirect("LeaveCertificate.aspx?ID="+Request.QueryString["id"].ToString());
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "update Student SET std='" + std + "' where Enrollmentno='" + Request.QueryString["id"].ToString() + "'";
            cmd2.Connection = con;
            cmd2.ExecuteNonQuery();
            Response.Redirect("PromoteStudent.aspx");
        }
    }
}