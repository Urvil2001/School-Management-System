using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.IO;
using Newtonsoft.Json.Linq;
using System.Configuration;
public partial class Visitor_Student_Admission : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    static string activationcode;
    string link2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        b1.Visible = true;
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        if (Label2.Visible == true)
        {
            Response.Write("<script>alert('Email id already exist')</script>");
        }
        else
        {
            if (Convert.ToInt16(std.Text) > 1)
            {
                if (pschoolname.Text == "")
                {
                    Response.Write("<script>alert('Please write school name')</script>");
                }
                else if (f3.FileName == "")
                {
                    Response.Write("<script>alert('Please Upload file')</script>");
                }
                else
                {

                    storedata();
                }
            }
            else
            {

                storedata();
            }
        }
    }

    private void storedata()
    {


        
      

        f1.SaveAs(Server.MapPath("~/Visitor/Birthcertificate/") + Path.GetFileName(f1.FileName));
        string link = "~/Visitor/Birthcertificate/" + Path.GetFileName(f1.FileName);
        f2.SaveAs(Server.MapPath("~/Visitor/Studentphoto/") + Path.GetFileName(f2.FileName));
        string link1 = "~/Visitor/Studentphoto/" + Path.GetFileName(f2.FileName);
        if (f3.HasFile)
        {
            f3.SaveAs(Server.MapPath("~/Visitor/Pmarksheet/") + Path.GetFileName(f3.FileName));
            link2 = "~/Visitor/Pmarksheet/" + Path.GetFileName(f3.FileName);
        }
        else
        {
            link2 = "";
        }


        SqlCommand cmd = new SqlCommand();
        if (IsReCaptchValid())
        {
            if (gender.SelectedItem.Text == "Select Gender")
            {
                Response.Write("<script>alert('Please select gender')</script>");
            }
            else
            {
                Random r = new Random();
                activationcode = r.Next(1001, 9999).ToString();
                cmd.CommandText = "insert into Admission values('" + firstname.Text + "','" + fathername.Text + "','" + lastname.Text + "','" + dob.Text + "','" + gender.Text + "','" + std.Text + "','" + pschoolname.Text + "','" + address.Text + "'," + mob.Text + ",'" + email.Text + "','" + password.Text + "','" + link + "','" + link1 + "','" + link2 + "','Unverified','" + activationcode + "','" + DropDownList1.Text + "','" + ans.Text + "')";
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                sendcode();
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }
        else
        {
            lblMessage1.ForeColor = System.Drawing.Color.Red;
            lblMessage1.Text = "Your captcha text verification is unsuccessfully. You entered invalid captcha";
        }
    }

    public bool IsReCaptchValid()
    {
        var result = false;
        var captchaResponse = Request.Form["g-recaptcha-response"];
        var secretKey = "6Lc1V7MaAAAAAByIzcfykj3rOXRxk4VBR4utzNtS";
        var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
        var requestUri = string.Format(apiUrl, secretKey, captchaResponse);
        var request = (HttpWebRequest)WebRequest.Create(requestUri);

        using (WebResponse response = request.GetResponse())
        {
            using (StreamReader stream = new StreamReader(response.GetResponseStream()))
            {
                JObject jResponse = JObject.Parse(stream.ReadToEnd());
                var isSuccess = jResponse.Value<bool>("success");
                result = (isSuccess) ? true : false;
            }
        }
        return result;
    }

    private void sendcode()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$Kingworld109");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Activation code to verify Email Address";
        msg.Body = "Dear " + firstname.Text + " " + fathername.Text + " " + lastname.Text + ",Your activation code is " + activationcode + "\n\n\n Thanks & Regard from Parshav";
        string toaddress = email.Text;
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
    }
    protected void email_TextChanged(object sender, EventArgs e)
    {
          if (!string.IsNullOrEmpty(email.Text))
        {
            
            //con.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\Dell\\Desktop\\Finalschoolmanagementsystem\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True";
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select count(email) from Admission where email='" + email.Text + "'";
            int co =Convert.ToInt16(cmd.ExecuteScalar());
          
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandText = "select count(username) from Login where username='" + email.Text + "'";
            int co1 = Convert.ToInt16(cmd2.ExecuteScalar());
            if (co>0)
            {
                Label2.Visible = true;
                Label2.Text = "Username Already Exist..!!";
                Label2.ForeColor = System.Drawing.Color.Red;

            }
            else if (co1 > 0)
            {
                Label2.Visible = true;
                Label2.Text = "Username Already Exist..!!";
                Label2.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Label2.Visible = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        string myquery = "select * from Admission where email='" + email.Text+ "'";
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string activationcode;
            activationcode = ds.Tables[0].Rows[0]["activation"].ToString();
            if (activationcode == TextBox1.Text)
            {
                changestatus();
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "wrong()", true);
            }
        }
        



    }
    private void changestatus()
    {
      
        string updatedata = "update Admission set status='verified' where email='" + email.Text + "'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

    }
    protected void std_SelectedIndexChanged(object sender, EventArgs e)
    {
        int no=0;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Division where std=" + std.SelectedItem.Value + "";
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            no = Convert.ToInt32(ds.Tables[0].Rows[0]["noofseat"]); 
        }
        
     
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select count(id) from Student where std=" + std.SelectedItem.Value + "";
        cmd1.Connection = con;
        int countstu = Convert.ToInt16(cmd1.ExecuteScalar());

        if (countstu < no)
        {
            b1.Visible = true;
        }
        else
        {
            b1.Visible = false;
            Response.Write("<script>alert('Admission is full..')</script>");

        }

    }
    protected void std_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "select count(noofseat) from Division where std=" + std.SelectedItem.Value + "";
        //cmd.Connection = con;
        //int no = Convert.ToInt16(cmd.ExecuteScalar());
        //SqlCommand cmd1 = new SqlCommand();
        //cmd1.CommandText = "select count(Enrollmentno) from Student where std=" + std.SelectedItem.Value + "";
        //cmd1.Connection = con;
        //int countstu = Convert.ToInt16(cmd1.ExecuteScalar());

        //if (countstu < no)
        //{
        //}
        //else
        //{
        //    b1.Visible = false;
        //    Response.Write("<script>alert('Admission is full..')</script>");

        //}


    }
    protected void std_TextChanged(object sender, EventArgs e)
    {
        int no = 0;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Division where std=" + std.SelectedItem.Value + "";
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            no = Convert.ToInt32(ds.Tables[0].Rows[0]["noofseat"]);
        }


        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select count(Enrollmentno) from Student where std=" + std.SelectedItem.Value + "";
        cmd1.Connection = con;
        int countstu = Convert.ToInt16(cmd1.ExecuteScalar());

        if (countstu < no)
        {
            b1.Visible = true;
        }
        else
        {
            b1.Visible = false;
            Response.Write("<script>alert('Admission is full..')</script>");

        }


    }
}
