using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_EditTeacherDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        id = Convert.ToInt32(Request.QueryString["id"].ToString());


        if (IsPostBack) return;


        
       
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Teacher where id=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                fname1.Text = dr["fname"].ToString();
                mname1.Text = dr["mname"].ToString();
                lname1.Text = dr["lname"].ToString();
                DateTime d1 = Convert.ToDateTime(dr["dob"].ToString());
                DOB1.Text = d1.ToShortDateString();

                gender1.Text = dr["gender"].ToString();
                std1.Text = dr["standard"].ToString();
                //sub.Text = dr["subjectname"].ToString();
                salary.Text = dr["salary"].ToString();
                address1.Text = dr["address"].ToString();
                mob1.Text = dr["ph_no"].ToString();
                email1.Text = dr["emailid"].ToString();
                Image2.ImageUrl = dr["pic"].ToString();
                TextBox3.Text = dr["pic"].ToString();
                DateTime d = Convert.ToDateTime(dr["doj"].ToString());
                doj.Text = d.ToShortDateString();
            }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload2.HasFile)
        {
            FileUpload2.SaveAs(Server.MapPath("~/Teacher/PIC/") + Path.GetFileName(FileUpload2.FileName));
            string link = "~/Teacher/PIC/" + Path.GetFileName(FileUpload2.FileName);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "update Teacher SET fname='" + fname1.Text + "',mname='" + mname1.Text + "',lname='" + lname1.Text + "',dob='" + DOB1.Text + "',gender='" + gender1.SelectedItem.Text + "',standard='" + std1.SelectedItem.Text + "',address='" + address1.Text + "',ph_no='" + mob1.Text + "',emailid='" + email1.Text + "',pic='" + link + "',salary='" + salary.Text + "',subjectname='"+sub.SelectedItem.Text+"' where id=" + id + "";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
            Div2.Style.Add("display", "block");
            Label2.Text = "Teacher Detail Updated";


        }
        else
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update Teacher SET fname='" + fname1.Text + "',mname='" + mname1.Text + "',lname='" + lname1.Text + "',dob='" + DOB1.Text + "',gender='" + gender1.SelectedItem.Text + "',standard='" + std1.SelectedItem.Text + "',address='" + address1.Text + "',ph_no='" + mob1.Text + "',emailid='" + email1.Text + "',pic='" + TextBox3.Text + "',salary='" + salary.Text + "',subjectname='" + sub.SelectedItem.Text + "' where id=" + id + "";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Div2.Style.Add("display", "block");
            Label2.Text = "Teacher Detail Updated";

        }
    }
}