using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Student_Attendance : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select CONVERT(varchar(10),date,110) as Date,status as Status from Attendance Where rollno='" + Session["enroll"] + "' and month(date)='" + DropDownList1.SelectedItem.Value + "'";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "select count(status) from Attendance where rollno='" + Session["enroll"] + "' and month(date)='" + DropDownList1.SelectedItem.Value + "' and status='Present'";
        cmd2.Connection = con;
        Label1.Text = Convert.ToString(cmd2.ExecuteScalar());

        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "select count(status) from Attendance where rollno='" + Session["enroll"] + "' and month(date)='" + DropDownList1.SelectedItem.Value + "' and status='Absent'";
        cmd3.Connection = con;
        Label2.Text = Convert.ToString(cmd3.ExecuteScalar());
    }
    
}