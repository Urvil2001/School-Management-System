using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
public partial class Admin_Complaint_Reply : System.Web.UI.Page
{
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
            if (Request.QueryString["complaint_id"] != null)
            {
                int c_id = Convert.ToInt16(Request.QueryString["complaint_id"].ToString());
               
                string myquery = "select * from complaint where c_id=" + c_id + "";

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    eid.Text = ds.Tables[0].Rows[0]["c_id"].ToString();
                    name.Text = ds.Tables[0].Rows[0]["name"].ToString();
                    email.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    date.Text = ds.Tables[0].Rows[0]["date"].ToString();
                    query.Text = ds.Tables[0].Rows[0]["query"].ToString();
                    reply.Text = ds.Tables[0].Rows[0]["reply"].ToString();

                }
             
            }
        }
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        
        SqlCommand cmd = new SqlCommand();
       
        cmd.CommandText = "update complaint Set status=@status,reply=@reply,who=@who where c_id=@c_id";
        cmd.Connection = con;
        string sta = "Processed";
        cmd.Parameters.AddWithValue("@status", sta);
        cmd.Parameters.AddWithValue("@reply", reply.Text);
        cmd.Parameters.AddWithValue("@c_id", Convert.ToInt16(eid.Text));
        cmd.Parameters.AddWithValue("@who", "Admin");

        cmd.ExecuteNonQuery();
        cmd.Dispose();
       

        //SmtpClient smtp = new SmtpClient();
        //smtp.Host = "smtp.gmail.com";
        //smtp.Port = 587;
        //smtp.Credentials = new System.Net.NetworkCredential("know4technical@gmail.com", "$kingworld109");
        //smtp.EnableSsl = true;
        //MailMessage msg = new MailMessage();
        //msg.Subject = "Replying your Complaint";
        ////msg.Body = reply.Text;
        ////string toaddress = email.Text;
        ////msg.To.Add(toaddress);
        //string fromaddress = "Shah urvil<know4technical@gmail.com>";
        //msg.From = new MailAddress(fromaddress);
        //try
        //{
        //    smtp.Send(msg);
        //}
        //catch
        //{
        //    throw;
        //}

        Response.Write("<script>alert('Reply send Successfully')</script>");
        Response.Redirect("ComplaintList.aspx");
    }
  
}