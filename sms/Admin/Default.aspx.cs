using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_Default : System.Web.UI.Page
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
        cmd.CommandText = "select count(id) from Accountant";
        cmd.Connection = con;
        Label1.Text = Convert.ToString(cmd.ExecuteScalar());
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select count(id) from Teacher";
        cmd1.Connection = con;
        Label3.Text = Convert.ToString(cmd1.ExecuteScalar());
        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "select count(Enrollmentno) from Student";
        cmd2.Connection = con;
        Label2.Text = Convert.ToString(cmd2.ExecuteScalar());

        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "select sum(amount) from Feespayment where rollid='2'";
        cmd3.Connection = con;
        int earn = Convert.ToInt32(cmd3.ExecuteScalar());
        Literal1.Text = earn.ToString();


        SqlCommand cmd4 = new SqlCommand();
        cmd4.CommandText = "select sum(amount) from Feespayment where rollid='3'";
        cmd4.Connection = con;
        int spend = Convert.ToInt32(cmd4.ExecuteScalar());
        Literal2.Text = spend.ToString();

        SqlCommand cmd5 = new SqlCommand();
        cmd5.CommandText = "select count(e_id) from Enquiry";
        cmd5.Connection = con;
        int inq = Convert.ToInt32(cmd5.ExecuteScalar());
        Literal5.Text = inq.ToString();

        SqlCommand cmd6 = new SqlCommand();
        cmd6.CommandText = "select count(leaveapplicationid) from Leave_application where rollid='3'";
        cmd6.Connection = con;
        int leave = Convert.ToInt32(cmd6.ExecuteScalar());
        Literal3.Text = leave.ToString();

        SqlCommand cmd7 = new SqlCommand();
        cmd7.CommandText = "select count(c_id) from complaint";
        cmd7.Connection = con;
        int com = Convert.ToInt32(cmd7.ExecuteScalar());
        Literal4.Text = com.ToString();
    }
}