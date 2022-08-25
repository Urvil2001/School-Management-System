using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Student_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        Image1.ImageUrl =Convert.ToString(Session["photo"]);
            //Label2.Text = Session["uname"].ToString();
            SqlCommand cmd = new SqlCommand();
            int month = DateTime.Now.Month;
            cmd.CommandText = "select count(status) from Attendance where month(date)='" + month + "' and rollno='" +Convert.ToString(Session["enroll"])+ "' and status='Present'";
            cmd.Connection = con;
            int presentdays = Convert.ToInt16(cmd.ExecuteScalar());
            Label8.Text = presentdays.ToString();

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "select count(status) from Attendance where month(date)='" + month + "' and rollno='" +Convert.ToString(Session["enroll"]) + "' and status='Absent'";
            cmd2.Connection = con;
            int absentdays = Convert.ToInt16(cmd2.ExecuteScalar());
            Label9.Text = absentdays.ToString();

            Literal1.Text = Convert.ToString(Session["uname"]);

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "select count(c_id) from complaint where email='" + Convert.ToString(Session["username"]) + "'";
            cmd3.Connection = con;
            Label11.Text = Convert.ToString(cmd3.ExecuteScalar());

            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandText = "select count(c_id) from complaint where email='" + Convert.ToString(Session["username"]) + "' and status='Processed'";
            cmd4.Connection = con;
            Label12.Text = Convert.ToString(cmd4.ExecuteScalar());

            //SqlCommand cmd5 = new SqlCommand();
            //cmd5.CommandText = "select count(leaveapplicationid) from Leave_application where rollno='"+Convert.ToString(Session["roll"])+"' and standardid='"+Convert.ToString(Session["std"])+"' and div='"+Convert.ToString(Session["div"])+"'";
            //cmd5.Connection = con;
            //Label10.Text = Convert.ToString(cmd5.ExecuteScalar());

            SqlCommand cmd6 = new SqlCommand();
            cmd6.CommandText="select count(leaveapplicationid) from Leave_application where rollno='"+Convert.ToString(Session["roll"])+"' and standardid='"+Convert.ToString(Session["std"])+"' and div='"+Convert.ToString(Session["div"])+"' and status='Accept'";
            cmd6.Connection = con;
            Label10.Text = Convert.ToString(cmd6.ExecuteScalar());

        }
    }
