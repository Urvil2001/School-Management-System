using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_AddTeacher : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    String encrypwd;
    Random r = new Random();
    string pass;
    int id;
    public static string mail;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (!IsPostBack)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;

        }
        else
        {
            Panel2.Visible = true;
        }

    }
    protected void b1_Click(object sender, EventArgs e)
    {
        mail = email.Text;
        if (role.SelectedIndex == 0)
        {
            Response.Write("<script>alert('Please Select Role')</script>");
            Panel2.Visible = false;
        }
        else if (role.SelectedIndex == 3)
        {
            pass = r.Next(0, 1000000).ToString("D6");
            f2.SaveAs(Server.MapPath("~/Teacher/PIC/") + Path.GetFileName(f2.FileName));
            string link = "~/Teacher/PIC/" + Path.GetFileName(f2.FileName);
            f3.SaveAs(Server.MapPath("~/Teacher/Qualification/") + Path.GetFileName(f3.FileName));
            string link1 = "~/Teacher/Qualification/" + Path.GetFileName(f3.FileName);
          
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();

            cmd.CommandText = "insert into Admin(fname,lname,dob,gender,address,ph_no,emailid,password,doj,pic,quali,salary) values('" + fname.Text + "','" + lname.Text + "','" + dob.Text + "','" + DropDownList1.SelectedItem.Text + "','" + address.Text + "'," + mob.Text + ",'" + email.Text + "','" + pass + "','" + doj.Text + "','" + link + "','" + link1 + "'," + salary.Text + ")";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            encryption1();
            cmd1.CommandText = "insert into Login(username,password,status,que,ans,role_id) values('" + email.Text + "','" + encrypwd + "','0','" + que.Text + "','" + ans.Text + "','1')";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
     
            msg();

            fname.Text = "";
            lname.Text = "";
            dob.Text = "";
            DropDownList1.SelectedItem.Text = "select gender";
            doj.Text = "";
            address.Text = "";
            mob.Text = "";
            salary.Text = "";
            email.Text = "";
            ans.Text = "";
            

            Response.Write("<script>alert('Admin Addded Sucessfully..')</script>");
            Panel2.Visible = false;
        }
        else if (role.SelectedIndex == 2)
        {

            pass = r.Next(0, 1000000).ToString("D6");
            f2.SaveAs(Server.MapPath("~/Teacher/PIC/") + Path.GetFileName(f2.FileName));
            string link = "~/Teacher/PIC/" + Path.GetFileName(f2.FileName);
            f3.SaveAs(Server.MapPath("~/Teacher/Qualification/") + Path.GetFileName(f3.FileName));
            string link1 = "~/Teacher/Qualification/" + Path.GetFileName(f3.FileName);
            
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
      
            cmd.CommandText = "insert into Accountant(fname,lname,dob,gender,address,ph_no,emailid,password,doj,pic,quali,salary) values('" + fname.Text + "','" + lname.Text + "','" + dob.Text + "','" + DropDownList1.SelectedItem.Text + "','" + address.Text + "'," + mob.Text + ",'" + email.Text + "','" + pass + "','" + doj.Text + "','" + link + "','" + link1 + "'," + salary.Text + ")";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            encryption1();
            cmd1.CommandText = "insert into Login(username,password,status,que,ans,role_id) values('" + email.Text + "','" + encrypwd + "','0','" + que.Text + "','" + ans.Text + "','4')";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
         
            msg();

            fname.Text = "";
            lname.Text = "";
            dob.Text = "";
            DropDownList1.SelectedItem.Text = "select gender";
            doj.Text = "";
            address.Text = "";
            mob.Text = "";
            salary.Text = "";
            email.Text = "";
            ans.Text = "";


            Response.Write("<script>alert('Accountant Add Sucessfully..')</script>");
        }
        else if (role.SelectedIndex == 1)
        {

            pass = r.Next(0, 1000000).ToString("D6");
            f2.SaveAs(Server.MapPath("~/Teacher/PIC/") + Path.GetFileName(f2.FileName));
            string link = "~/Teacher/PIC/" + Path.GetFileName(f2.FileName);
            f3.SaveAs(Server.MapPath("~/Teacher/Qualification/") + Path.GetFileName(f3.FileName));
            string link1 = "~/Teacher/Qualification/" + Path.GetFileName(f3.FileName);
          
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
   
            cmd.CommandText = "insert into Teacher(fname,lname,dob,gender,address,ph_no,emailid,password,doj,pic,quali,salary) values('" + fname.Text + "','" + lname.Text + "','" + dob.Text + "','" + DropDownList1.SelectedItem.Text + "','" + address.Text + "'," + mob.Text + ",'" + email.Text + "','" + pass + "','" + doj.Text + "','" + link + "','" + link1 + "'," + salary.Text + ")";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            encryption1();
            cmd1.CommandText = "insert into Login(username,password,status,que,ans,role_id) values('" + email.Text + "','" + encrypwd + "','0','" + que.Text + "','" + ans.Text + "','3')";
            cmd1.Connection = con;
            cmd1.ExecuteNonQuery();
          
            msg();
            
            
            fname.Text = "";
            lname.Text = "";
            dob.Text = "";
            DropDownList1.SelectedItem.Text = "select gender";
            doj.Text = "";
            address.Text = "";
            mob.Text = "";
            salary.Text = "";
            email.Text = "";
            ans.Text = "";
            Panel1.Visible = false;
            Panel2.Visible = true;

            Response.Write("<script>alert('Teacher Add Sucessfully..')</script>");
        }
    }
    public void msg()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$kingworld109");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "About your Login";
        msg.Body = "Dear " + fname.Text + " , " + lname.Text + ",Your Id=" + email.Text + "and Password=" + pass;
        string toaddress = email.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Parshav <know4technical@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }
    public void encryption1()
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[pass.ToString().Length];
        encode = Encoding.UTF8.GetBytes(pass.ToString());
        strmsg = Convert.ToBase64String(encode);
        encrypwd = strmsg;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
      
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        cmd2.Connection = con;
        cmd2.CommandText = "select id from Teacher where emailid='" + mail + "'";
        cmd2.Connection = con;
        id = Convert.ToInt32(cmd2.ExecuteScalar());


        cmd.CommandText = "Update Teacher SET standard='" + std.SelectedItem.Value + "',subjectname='" + subject.SelectedItem.Text + "' where emailid='" + mail + "' ";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

        cmd1.CommandText = "insert into class values('" + cstd.SelectedItem.Value + "','" + div.SelectedItem.Text + "'," + id + ")";
        cmd1.Connection = con;
        cmd1.ExecuteNonQuery();
  
        Response.Write("<script>alert('Saved this data...')</script>");
    }
}