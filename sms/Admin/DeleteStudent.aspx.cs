using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_DeleteStudent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        

        if (Request.QueryString.ToString() == "")
        {
            Response.Redirect("ViewStudentDetails.aspx");
        }
        else
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText="Delete from Student where Enrollmentno="+id+"";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            
        }
        Response.Redirect("ViewStudentDetails.aspx");

    }
}