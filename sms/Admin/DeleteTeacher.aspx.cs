using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_DeleteTeacher : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    int id;
    string username;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();



        if (Request.QueryString.ToString() == "")
        {
            Response.Redirect("TeacherDetails.aspx");
        }
        else
        {
             id = Convert.ToInt32(Request.QueryString["id"].ToString());
            SqlCommand cmd3=new SqlCommand();
            cmd3.CommandText="select emailid from Teacher where id="+id+"";
            cmd3.Connection=con;
            SqlDataAdapter sda=new SqlDataAdapter(cmd3);
            DataSet ds=new DataSet();
            sda.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                username=ds.Tables[0].Rows[0]["emailid"].ToString();
            }

           
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Delete from Teacher where id=" + id + "";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "delete from Login where username='" + username + "'";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
        }
        Response.Redirect("TeacherDetails.aspx");

    }
}