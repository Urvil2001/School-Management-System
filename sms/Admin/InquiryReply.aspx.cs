using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Data;
public partial class Admin_InquiryReply : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    int e_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        if (!IsPostBack)
        {
            if (Request.QueryString["Inquiry_id"] != null)
            {
                e_id = Convert.ToInt16(Request.QueryString["Inquiry_id"].ToString());

                string myquery = "select * from Enquiry where e_id=" + e_id + "";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    eid.Text = ds.Tables[0].Rows[0]["e_id"].ToString();
                    name.Text = ds.Tables[0].Rows[0]["studentname"].ToString();
                    email.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    date.Text = ds.Tables[0].Rows[0]["date"].ToString();
                    mob.Text = ds.Tables[0].Rows[0]["mobno"].ToString();
                    query.Text = ds.Tables[0].Rows[0]["query"].ToString();
                    reply.Text = ds.Tables[0].Rows[0]["reply"].ToString();

                }

            }
        }
    }
    protected void b1_Click(object sender, EventArgs e)
    {
         SqlCommand cmd = new SqlCommand();
       
        cmd.CommandText = "update Enquiry Set status=@status,reply=@reply where e_id=@e_id";
        cmd.Connection = con;
        string sta = "Processed";
        cmd.Parameters.AddWithValue("@status", sta);
        cmd.Parameters.AddWithValue("@reply", reply.Text);
        cmd.Parameters.AddWithValue("@e_id", Convert.ToInt16(eid.Text));
       
        cmd.ExecuteNonQuery();
        cmd.Dispose();
       

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$kingworld109");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Replying your Complaint";
        msg.Body = reply.Text;
        string toaddress = email.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Shah urvil<know4technical@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }

        Response.Write("<script>alert('Reply send Successfully')</script>");
        Response.Redirect("InquiryList.aspx");
    }
}