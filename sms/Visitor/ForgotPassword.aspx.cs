using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class Visitor_ForgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    static String decryptedpwd;
    static String uname;
    Random rnd = new Random();
    public static string otp;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        


       
        SqlCommand cmd = new SqlCommand();
     
        cmd.Connection = con;
        cmd.CommandText = "select * from Login where username='" + username.Text + "'";
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            uname = ds.Tables[0].Rows[0]["username"].ToString();
            string ans = ds.Tables[0].Rows[0]["ans"].ToString();
            if (username.Text == uname)
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
               
               
            }
            else
            {
                error.Style.Add("display", "block");
                Label1.Text = "Invalid Username And Password";
            }
        }
            else
            {
            error.Style.Add("display", "block");
            Label1.Text = "Invalid Username And Password";
            }
        
    }
    public void sendforgot()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$kingworld109");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
       
        SqlCommand cmd = new SqlCommand();
   
        cmd.Connection = con;
        cmd.CommandText = "select password from Login where username='" + username.Text + "'";
        String pass = Convert.ToString(cmd.ExecuteScalar());
        decryptpwd(pass);
        msg.Subject = "For Forgot Password";
        msg.Body = "Your Password is:" + decryptedpwd;
        string toaddress = username.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Urvil <know4technical@gmail.com>";
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

    private void decryptpwd(String encrytpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encrytpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        decryptedpwd = decryptpwd;

    }
    protected void submit_Click(object sender, EventArgs e)
    {
      
    
        SqlCommand cmd = new SqlCommand();
       
        cmd.Connection = con;
        cmd.CommandText = "select * from Login where username='" + uname + "'";
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string que = ds.Tables[0].Rows[0]["que"].ToString();
            string ans = ds.Tables[0].Rows[0]["ans"].ToString();
            if (DropDownList1.Text == que && TextBox1.Text == ans)
            {
                sendforgot();
                
            }
            else
            {
                Div1.Style.Add("display", "block");
                Label2.Text = "Invalid Security question or Password....";
            }
        }
            else
            {
                Div1.Style.Add("display", "block");
                Label2.Text = "Invalid Security question or Password....";   
            }

        }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
    }
    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = true;
        otp = rnd.Next(0, 1000000).ToString("D6");
        sendotp();
    }
    public void sendotp()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$kingworld109");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();

       
        msg.Subject = "For Forgot Password";
        msg.Body = "Your OTP is:" + otp;
        string toaddress = username.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Urvil <know4technical@gmail.com>";
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

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == otp)
        {
            sendforgot();
            Div3.Style.Add("display", "block");
            Label4.Text = "Sending Password on your Mail..";
            Div2.Visible = false;
            Label3.Visible = false;
        }
        else
        {
            Div2.Style.Add("display", "block");
            Label3.Text = "Enter OTP is Does not match....";
        }
    }
}
