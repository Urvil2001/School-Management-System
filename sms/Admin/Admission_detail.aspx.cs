using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Text;
public partial class Admin_student_detail : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    String encrypwd;
    string que;
    string ans;
    string password;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        if (Request.QueryString["username"] != null)
        {
            string email = Request.QueryString["username"].ToString();
            string myquery = "select fname,mname,lname,CONVERT(varchar(10),dob,110) as dob,gender,pschoolname,address,phno,email,status,studentphoto,birthcertificate,pmarksheet,que,ans,password,std from Admission where email='" + email + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                fname.Text=ds.Tables[0].Rows[0]["fname"].ToString();
                Label1.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                mname.Text = ds.Tables[0].Rows[0]["mname"].ToString();
                lname.Text = ds.Tables[0].Rows[0]["lname"].ToString();
                dob.Text = ds.Tables[0].Rows[0]["dob"].ToString();
                gender.Text = ds.Tables[0].Rows[0]["gender"].ToString();
                pschoolname.Text = ds.Tables[0].Rows[0]["pschoolname"].ToString();
                address.Text = ds.Tables[0].Rows[0]["address"].ToString();
                mobno.Text = ds.Tables[0].Rows[0]["phno"].ToString();
                emailid.Text = ds.Tables[0].Rows[0]["email"].ToString();
                verified.Text = ds.Tables[0].Rows[0]["status"].ToString();
                if (verified.Text == "verified")
                {
                    verified.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    verified.ForeColor = System.Drawing.Color.Red;
                }
                Image1.ImageUrl = ds.Tables[0].Rows[0]["studentphoto"].ToString();
                Image2.ImageUrl = ds.Tables[0].Rows[0]["birthcertificate"].ToString();
                Image3.ImageUrl = ds.Tables[0].Rows[0]["pmarksheet"].ToString();
                que = ds.Tables[0].Rows[0]["que"].ToString();
                ans = ds.Tables[0].Rows[0]["ans"].ToString();
                password = ds.Tables[0].Rows[0]["password"].ToString();
                std.Text = ds.Tables[0].Rows[0]["std"].ToString();
            }
            else
            {
                Response.Redirect("~/Admin/Admission.aspx");

            }
           
        }
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
       
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        encryption1();
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$Kingworld109");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "About your admission";
        msg.Body = "Dear " + fname.Text + " " + mname.Text + " " + lname.Text + ",Your admission has been approved...Please pay fees within 5 days,and your login id and password is now active but if you not paying fees within 5 days your login id and password will be diactivate.  \n\n\n Thanks & Regard from Parshav";
        string toaddress = emailid.Text;
        msg.To.Add(toaddress);
        string fromaddress = "parshav <know4technical@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into Login(username,password,status,que,ans,role_id,std,activation) values('" + emailid.Text + "','" + encrypwd + "',0,'" + que + "','" + ans + "',2," + std.Text + ",'no')";
      
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/Admin/Admission.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("parshav312@gmail.com", "parshav$786");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "About your admission...";
        msg.Body = "Dear " + fname.Text + " " + mname.Text + " " + lname.Text + ", Sorry,but unfortunately your admission has been disapproved.  \n\n\n Thanks & Regard from parshav";
        string toaddress = emailid.Text;
        msg.To.Add(toaddress);
        string fromaddress = "parshav <parshav312@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "delete from Admission where email='" + emailid.Text + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/Admin/Admission.aspx");
    }

    public void encryption1()
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.ToString().Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        encrypwd = strmsg;
    }
}