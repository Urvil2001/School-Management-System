using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_Default2 : System.Web.UI.Page
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
        cmd.CommandText = "select Student.studentphoto,Student.Enrollmentno,Student.fname,Student.mname,Student.lname,Student.dob,Student.gender,Student.roll,Student.std,Student.div,Student.address,Student.phno,Student.email,Login.activation from Student Inner JOIN Login ON Login.username=Student.email";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        r1.DataSource = dt;
        r1.DataBind();
    }
}