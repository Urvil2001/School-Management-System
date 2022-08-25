using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_PromoteStudent : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        int standard = Convert.ToInt16(Session["std"]);

        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select Student.studentphoto,Student.Enrollmentno,Student.roll,Student.fname,Student.mname,Student.lname,Student.std,Result.Percentage from Student Inner JOIN Result ON Student.roll=Result.rollno where Student.std=" + standard + "";
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            r1.DataSource = ds;
            r1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
}