using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Student_Complaint : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        fname.Text = Convert.ToString(Session["uname"]);
        emailid.Text = Convert.ToString(Session["username"]);
        time.Text = Convert.ToString(System.DateTime.Now);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into complaint(name,email,date,query,status) values ('" + fname.Text + "','" + emailid.Text + "','" + time.Text + "','" + TextBox1.Text + "','Pending')";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        error.Style.Add("display", "block");
        Label1.Text = "Complaint Send...";

    }
}