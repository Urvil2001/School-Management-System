using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Teacher_ApplyforLeaveApplication : System.Web.UI.Page
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
        std.Text = Convert.ToString(Session["std"]);
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into Leave_application(description,leavedate,noofdays,studentname,standardid,status,rollno,rollid) values('" + des.Text + "','" + leavdate.Text + "'," + DropDownList1.SelectedItem.Value + ",'" + fname.Text + "','" + std.Text + "','Pending','" + Convert.ToString(Session["id"]) + "','3')";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        error.Style.Add("display", "block");
        Label1.Text = "Application Submitted Wait for reply..";
    }
}