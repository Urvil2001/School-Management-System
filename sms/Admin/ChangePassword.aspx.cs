using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
public partial class Admin_ChangePassword : System.Web.UI.Page
{
    static String decryptedpwd;
    String encrypwd;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
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
     
            
               
                string oldpw = opass.Text;
                string newpw = npass.Text;
                
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = ("select * from Login where username='" + Session["username"].ToString() + "'");


                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                String uname;
                String pass;
                if (ds.Tables[0].Rows.Count > 0)
                {
                    uname = ds.Tables[0].Rows[0]["username"].ToString();
                    pass = ds.Tables[0].Rows[0]["password"].ToString();
                    decryptpwd(pass);
                    if (uname == Session["username"].ToString() && decryptedpwd == opass.Text)
                    {
                        encryption1();
                        cmd = new SqlCommand("update Login set password='" + encrypwd + "' where username='" + Session["username"].ToString() + "'", con);
                        cmd.ExecuteNonQuery();
                        
                        Div2.Style.Add("display", "block");
                        Label1.Text = "password is change successfully";
                        Label2.Visible = false;

                        string message = "Password is changed...";
                        string url = "~/Visitor/Login.aspx";
                        string script = "window.onload = function(){ alert('";
                        script += message;
                        script += "');";
                        script += "window.location = '";
                        script += url;
                        script += "'; }";
                    }
                   
                    else
                {
                    Div1.Style.Add("display", "block");
                    Label2.Text = "invalid password please enter corrent password";
                }
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

    public void encryption1()
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[npass.Text.ToString().Length];
        encode = Encoding.UTF8.GetBytes(npass.Text);
        strmsg = Convert.ToBase64String(encode);
        encrypwd = strmsg;
    }
}