using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Teacher_AssignRollno : System.Web.UI.Page
{
    int noofstudent;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (!IsPostBack)
        {
            countstu();
        }
        else
        {
            countstu();
        }
    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    public void countstu()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select count(Enrollmentno) from Student where div='" + Convert.ToString(Session["div"]) + "' and std='"+Convert.ToString(Session["std"])+"'";
        cmd.Connection = con;
        int studentcount = Convert.ToInt16(cmd.ExecuteScalar());

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "select noofseat from Division where divname='" + Convert.ToString(Session["div"]) + "' and std='" + Convert.ToString(Session["std"]) + "'";
        cmd2.Connection = con;
       
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd2;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        
        if (ds.Tables[0].Rows.Count > 0)
        {
            noofstudent = Convert.ToInt16(ds.Tables[0].Rows[0]["noofseat"]);
         
        }

        if (studentcount == noofstudent)
        {
            Button1.Visible = false;
            Panel1.Visible = false;
            error.Style.Add("display", "block");
            Label1.Text = "Division is Full You can't add any more Student...";

        }
        else
        {
            TextBox roll = (TextBox)FormView1.FindControl("TextBox1");
            string div = Session["div"].ToString();
            string std = Session["std"].ToString();
            string rollno = std + div + roll.Text;

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "select count(roll) from Student where roll='" + rollno + "'";
            cmd3.Connection = con;
            int count = Convert.ToInt16(cmd3.ExecuteScalar());
            if (count > 0)
            {
                Response.Write("<script>alert('Roll Number is already exist..')</script>");
            }
            
        
        }
        

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select count(Enrollmentno) from Student where div='" + Convert.ToString(Session["div"]) + "' and std='" + Convert.ToString(Session["std"]) + "'";
        cmd.Connection = con;
        int studentcount = Convert.ToInt16(cmd.ExecuteScalar());

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "select noofseat from Division where divname='" + Convert.ToString(Session["div"]) + "' and std='" + Convert.ToString(Session["std"]) + "'";
        cmd2.Connection = con;

        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd2;
        DataSet ds = new DataSet();
        sda.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            noofstudent = Convert.ToInt16(ds.Tables[0].Rows[0]["noofseat"]);
        }

        if (studentcount == noofstudent)
        {
            Button1.Visible = false;


        }
        else
        {
            TextBox roll = (TextBox)FormView1.FindControl("TextBox1");
            string div = Session["div"].ToString();
            string std = Session["std"].ToString();
            string rollno = std + div + roll.Text;

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "select count(roll) from Student where roll='" + rollno + "'";
            cmd3.Connection = con;
            int count = Convert.ToInt16(cmd3.ExecuteScalar());
            if (count > 0)
            {
                Response.Write("<script>alert('Roll Number is already exist..')</script>");
            }
            else
            {

                Label enroll = (Label)FormView1.FindControl("EnrollmentnoLabel");
                Label email = (Label)FormView1.FindControl("emailLabel");
                SqlCommand cmd4 = new SqlCommand();
                cmd4.CommandText = "update Student SET roll='" + rollno + "',div='" + Session["div"] + "' where Enrollmentno='" + enroll.Text + "'";
                cmd4.Connection = con;
                cmd4.ExecuteNonQuery();

            }

        }
        
        
    }
}