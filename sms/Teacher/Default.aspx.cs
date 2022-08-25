using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Teacher_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        
        DateTime dt = DateTime.Now;
        int month = dt.Month;
        DateTime yr=DateTime.Now;
        int year=yr.Year;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select count(status) from Attendance where rollno='" + Session["id"] + "' and month(date)=" + month + " and year(date)=" + year + " and status='Present'";
        cmd.Connection = con;
        int count =Convert.ToInt16(cmd.ExecuteScalar());
        Label3.Text = count.ToString();

        //DateTime day = DateTime.Now;
        //int date =day.Day;


        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select count(status) from Attendance where rollno='" + Session["id"] + "' and month(date)=" + month + " and year(date)=" + year + " and status='Absent'";
        cmd1.Connection = con;
        int absent = Convert.ToInt16(cmd1.ExecuteScalar());
        Label1.Text = absent.ToString();

        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "select count(status) from Attendance where rollno='" + Session["id"] + "' and month(date)=" + month + " and year(date)=" + year + " and status='Leave'";
        cmd3.Connection = con;
        int Leave = Convert.ToInt16(cmd3.ExecuteScalar());
        Label4.Text = Leave.ToString();



        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "select * from Feespayment where email='" +Convert.ToString(Session["username"]) + "' and month(date)='"+month+"'";
        cmd2.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd2;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            TextBox1.Text = ds.Tables[0].Rows[0]["amount"].ToString();
        }

        SqlCommand cmd4 = new SqlCommand();
        cmd4.CommandText = "select * from Teacher where emailid='" + Session["username"].ToString() + "' ";
        cmd4.Connection = con;
        SqlDataAdapter sda2 = new SqlDataAdapter(cmd4);
        DataSet ds2 = new DataSet();
        sda2.Fill(ds2);
        if (ds2.Tables[0].Rows.Count > 0)
        {
            string fname = ds2.Tables[0].Rows[0]["fname"].ToString();
            string lname = ds2.Tables[0].Rows[0]["lname"].ToString();
            Literal1.Text = fname + " " + lname;
            Image1.ImageUrl = ds2.Tables[0].Rows[0]["pic"].ToString();
        }
    }
}