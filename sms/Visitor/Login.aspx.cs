using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;

public partial class Visitor_Login : System.Web.UI.Page
{
    static String lockstatus;
    static int attemptcount = 0;
    static String decryptedpwd;
    int role;
    string uname;
    string pass;
    string activation;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

        }
        else
        {
            Session["InvalidLogin"] = null;
        }

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
    }
    protected void b1_Click(object sender, EventArgs e)
    {
       
        string myquery = "select * from Login where username='" + username.Text + "'";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        String pass1;
        
        bool lockstatus;
        DateTime locktimedate = DateTime.Now;
        if (ds.Tables[0].Rows.Count == 0)
        {
            error.Style.Add("display", "block");
            Label1.Text = "Invalid Username And Password";
        }
        else
        {
           
            uname = ds.Tables[0].Rows[0]["username"].ToString();
            pass = ds.Tables[0].Rows[0]["password"].ToString();
            pass1 = ds.Tables[0].Rows[0]["password"].ToString();
            lockstatus = Convert.ToBoolean(ds.Tables[0].Rows[0]["status"].ToString());
            activation = ds.Tables[0].Rows[0]["activation"].ToString();
            decryptpwd(pass);
            if (lockstatus == true)
            {
                locktimedate = Convert.ToDateTime(ds.Tables[0].Rows[0]["lockdatetime"].ToString());
                locktimedate = Convert.ToDateTime(locktimedate.ToString("MM/dd/yyyy HH:mm:ss"));
            }

            

            if (lockstatus == true)
            {
                DateTime cdatetime = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss"));
                TimeSpan ts = cdatetime.Subtract(locktimedate);
                int minuslocked = Convert.ToInt32(ts.TotalMinutes);
                int pendingtime = 15 - minuslocked;
                if (pendingtime <= 0)
                {
                    unlockaccount();
                }
                else
                {
                    error.Style.Add("display", "block");
                    Label1.Text = "Your account has been locked for 15 minutes for three Invalid Attempts.Your account will be unlocked after 15 minutes";
                }
            }
            else
            {
                if (uname == username.Text && decryptedpwd == password.Text)
                {
                  
                    SqlCommand cmd1 = new SqlCommand();
                    
                    cmd1.Connection = con;
                    cmd1.CommandText = "select role_id from Login where username='" + username.Text + "'";
                    role = Convert.ToInt16(cmd1.ExecuteScalar());
                    con.Close();
                    if (role == 2)
                    {
                        if (activation == "no")
                        {
                            Session["username"] = uname;
                            Response.Redirect("~/Student/FeesPayment.aspx");
                        }
                        else
                        {
                            Session["username"] = uname;
                            Response.Redirect("~/Student/Default.aspx");
                        }
                    }
                    else if (role == 1)
                    {
                        Session["username"] = uname;
                        Response.Redirect("~/Admin/Default.aspx");
                    }
                    else if (role == 3)
                    {
                        Session["username"] = uname;
                        Response.Redirect("~/Teacher/Default.aspx");
                    }
                    else if (role == 4)
                    {
                        Session["username"] = uname;
                        Response.Redirect("~/Accountant/Default.aspx");
                    }
                }
                else
                {
                    int attemptcount;
                    if (Session["invalidloginattempt"] != null)
                    {
                        attemptcount = Convert.ToInt16(Session["invalidloginattempt"].ToString());
                        attemptcount = attemptcount + 1;
                    }
                    else
                    {
                        attemptcount = 1;
                    }
                    Session["invalidloginattempt"] = attemptcount;
                    if (attemptcount == 3)
                    {
                        error.Style.Add("display", "block");
                        Label1.Text = "Your account has been locked";
                        changelockstatus();
                        string body = this.PopulateBody("Hey",
           "Your account has been locked for 15 minute",
           "http://localhost:55102/sms/Visitor/Default2.aspx?username=" + uname,

           "Here ,You are trying to access of your account??" +
           " If yes then Clike this link and Press Yes Button"
           );
                        this.SendHtmlFormattedEmail(uname, "New article published!", body);
                        //Session["uname"] = uname;
                    }
                    else
                    {
                        error.Style.Add("display", "block");
                        Label1.Text = "Invalid Username & Password";
                    }
                }
            }
        }

    }

   
    void changelockstatus()
    {
     
        string format = "MM/dd/yyyy HH:mm:ss";
        string updatedata = "update Login set status=1, lockdatetime='" + DateTime.Now.ToString(format) + "' where username='" + username.Text + "'";
        
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

    }
    void unlockaccount()
    {

        


 
        string updatedata = "update Login set status=0, lockdatetime=null where username='" + username.Text + "'";
        
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();


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
    private string PopulateBody(string userName, string title, string url, string description)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{UserName}", userName);
        body = body.Replace("{Title}", title);
        body = body.Replace("{Url}", url);
        body = body.Replace("{Description}", description);
        return body;
    }

    private void SendHtmlFormattedEmail(string recepientEmail, string subject, string body)
    {
        using (MailMessage mailMessage = new MailMessage())
        {
            mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
            mailMessage.Subject = subject;
            mailMessage.Body = body;
            mailMessage.IsBodyHtml = true;
            mailMessage.To.Add(new MailAddress(recepientEmail));
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["Host"];
            smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);
            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
            NetworkCred.UserName = ConfigurationManager.AppSettings["UserName"];
            NetworkCred.Password = ConfigurationManager.AppSettings["Password"];
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);
            smtp.Send(mailMessage);
        }
    }
    }

