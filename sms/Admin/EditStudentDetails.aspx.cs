using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_EditStudentDetails : System.Web.UI.Page
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
            cmd.CommandText = "select * from Student where Enrollmentno=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                fname.Text = dr["fname"].ToString();
                mname.Text = dr["mname"].ToString();
                lname.Text = dr["lname"].ToString();
                dob.Text = dr["dob"].ToString();
                gender.Text = dr["gender"].ToString();
                std.Text = dr["std"].ToString();
                div1.Text = dr["div"].ToString();
                address.Text = dr["address"].ToString();
                mob.Text = dr["phno"].ToString();
                email.Text = dr["email"].ToString();
                Image1.ImageUrl = dr["studentphoto"].ToString();
                TextBox1.Text = dr["studentphoto"].ToString();
            }

        
        }
    
    protected void b1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile==true)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Visitor/Studentphoto/") + Path.GetFileName(FileUpload1.FileName));
            string link = "~/Visitor/Studentphoto/" + Path.GetFileName(FileUpload1.FileName);
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "update Student SET fname='" + fname.Text + "',mname='" + mname.Text + "',lname='" + lname.Text + "',dob='" + dob.Text + "',gender='" + gender.SelectedItem.Text + "',std='" + std.SelectedItem.Text + "',address='" + address.Text + "',phno='" + mob.Text + "',email='" + email.Text + "',studentphoto='" + link + "',div='" + div1.Text + "' where Enrollmentno=" + id + "";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
            error.Style.Add("display", "block");
            Label1.Text = "Student Detail Updated";


        }
        else
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "update Student SET fname='" + fname.Text + "',mname='" + mname.Text + "',lname='" + lname.Text + "',dob='" + dob.Text + "',gender='" + gender.SelectedItem.Text + "',std='" + std.SelectedItem.Text + "',address='" + address.Text + "',phno='" + mob.Text + "',email='" + email.Text + "',studentphoto='" + TextBox1.Text + "',div='" + div1.Text + "' where Enrollmentno=" + id + "";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            error.Style.Add("display", "block");
            Label1.Text = "Student Detail Updated";
        }
        //}
        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "update Student SET fname='" + fname.Text + "' where Enrollmentno="+id+"";
        //cmd.Connection = con;
        //cmd.ExecuteNonQuery();

    }
 
}