using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Student_FeesPayment : System.Web.UI.Page
{
    Random r=new Random();
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
            if (Session["username"] == null)
            {
                Response.Redirect("~/Visitor/Login.aspx");

            }

            else
            {
                
                SqlCommand cmd3 = new SqlCommand();
                cmd3.CommandText = "select activation from Login where username='" + Session["username"] + "'";
                cmd3.Connection = con;
                string activation = cmd3.ExecuteScalar().ToString();
                if (activation == "no")
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select * from Admission where email='" + Session["username"] + "'";
                
                    cmd.Connection = con;
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {


                        fname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                        mname.Text = ds.Tables[0].Rows[0]["mname"].ToString();
                        lname.Text = ds.Tables[0].Rows[0]["lname"].ToString();
                        string fullname = fname.Text + " " + mname.Text + " " + lname.Text;
                        std.Text = ds.Tables[0].Rows[0]["std"].ToString();
                        // Response.Cookies["sta"].Value = std.Text;
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandText = "select ((admissionfee+(tutionfee*12))/4)as 'sum' from Feesstructure where standard='" + std.Text + "'";
                        cmd1.Connection = con;
                        object total = cmd1.ExecuteScalar();
                        rupee.Text = total.ToString();
                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandText = "select sum(amount) from Feespayment where email='" + Session["username"] + "' group by email";
                        cmd2.Connection = con;
                        object total1 = cmd2.ExecuteScalar();

                        int am = Convert.ToInt32(total1);
                        int r = Convert.ToInt32(rupee.Text);
                        int rs = r * 4;
                        Label1.Text = (rs - am).ToString();

                        fname.Text = ds.Tables[0].Rows[0]["fname"].ToString();


                        email.Text = ds.Tables[0].Rows[0]["email"].ToString();
                        //Response.Cookies["em"].Value = email.Text;
                        mob.Text = ds.Tables[0].Rows[0]["phno"].ToString();
                        //Response.Cookies["mo"].Value = mob.Text;

                        HttpCookie Cookie = new HttpCookie("Username");
                        Cookie.Values.Add("std", std.Text);
                        Cookie.Values.Add("name", fullname);
                        Cookie.Values.Add("rupee", rupee.Text);
                        Cookie.Values.Add("email", email.Text);
                        Cookie.Values.Add("mob", mob.Text);
                        Cookie.Expires = DateTime.Now.AddHours(1);
                        Response.Cookies.Add(Cookie);
                    }
                }
                    else
                    {
                        SqlCommand cmd5 = new SqlCommand();
                        cmd5.CommandText = "select * from Student where email='" + Session["username"] + "'";

                        cmd5.Connection = con;
                        SqlDataAdapter sda2 = new SqlDataAdapter();
                        sda2.SelectCommand = cmd5;
                        DataSet ds2 = new DataSet();
                        sda2.Fill(ds2);
                        if (ds2.Tables[0].Rows.Count > 0)
                        {


                            fname.Text = ds2.Tables[0].Rows[0]["fname"].ToString();
                            mname.Text = ds2.Tables[0].Rows[0]["mname"].ToString();
                            lname.Text = ds2.Tables[0].Rows[0]["lname"].ToString();
                            string fullname = fname.Text + " " + mname.Text + " " + lname.Text;
                            std.Text = ds2.Tables[0].Rows[0]["std"].ToString();
                            // Response.Cookies["sta"].Value = std.Text;
                            SqlCommand cmd6 = new SqlCommand();
                            cmd6.CommandText = "select ((admissionfee+(tutionfee*12))/4)as 'sum' from Feesstructure where standard='" + std.Text + "'";
                            cmd6.Connection = con;
                            object total = cmd6.ExecuteScalar();
                            rupee.Text = total.ToString();
                            SqlCommand cmd7 = new SqlCommand();
                            cmd7.CommandText = "select sum(amount) from Feespayment where email='" + Session["username"] + "' group by email";
                            cmd7.Connection = con;
                            object total1 = cmd7.ExecuteScalar();

                            int am = Convert.ToInt32(total1);
                            int r = Convert.ToInt32(rupee.Text);
                            int rs = r * 4;
                            Label1.Text = (rs - am).ToString();
                            if (Label1.Text == "0")
                            {
                                Button1.Visible = false;
                            }

                            fname.Text = ds2.Tables[0].Rows[0]["fname"].ToString();


                            email.Text = ds2.Tables[0].Rows[0]["email"].ToString();
                            //Response.Cookies["em"].Value = email.Text;
                            mob.Text = ds2.Tables[0].Rows[0]["phno"].ToString();
                            //Response.Cookies["mo"].Value = mob.Text;

                            HttpCookie Cookie = new HttpCookie("Username");
                            Cookie.Values.Add("std", std.Text);
                            Cookie.Values.Add("name", fullname);
                            Cookie.Values.Add("rupee", rupee.Text);
                            Cookie.Values.Add("email", email.Text);
                            Cookie.Values.Add("mob", mob.Text);
                            Cookie.Expires = DateTime.Now.AddHours(1);
                            Response.Cookies.Add(Cookie);
                        }
                    }
                }
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string num=r.Next().ToString();
        Response.Cookies["num"].Value = num;
        String merchantKey = "s8cIUB!24FJY5@!5";
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("MID", "BlXpoB40493170358875");
        parameters.Add("CHANNEL_ID", "WEB");
        parameters.Add("INDUSTRY_TYPE_ID", "Retail");
        parameters.Add("WEBSITE", "WEBSTAGING");
        parameters.Add("EMAIL", email.Text);
        parameters.Add("MOBILE_NO", mob.Text);
        parameters.Add("CUST_ID", num);
        parameters.Add("ORDER_ID",num);
        parameters.Add("TXN_AMOUNT",rupee.Text);
        parameters.Add("CALLBACK_URL", "http://localhost:55102/sms/Student/callback.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.

        string checksum = paytm.CheckSum.generateCheckSum(merchantKey, parameters);
        string paytmURL = "https://securegw-stage.paytm.in/order/process?orderid=" + num;
        
       
        string outputHTML = "<html>";
        outputHTML += "<head>";
        outputHTML += "<title>Merchant Check Out Page</title>";
        outputHTML += "</head>";
        outputHTML += "<body>";
        outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
        
        outputHTML +="<form method='post' action='" + paytmURL + "' name='f1'>";
        outputHTML += "<table border='1'>";
        outputHTML += "<tbody>";
        foreach (string key in parameters.Keys)
        {
            outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
        }
        outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
        outputHTML += "</tbody>";
        outputHTML += "</table>";
        outputHTML += "<script type='text/javascript'>";
        outputHTML += "document.f1.submit();";
        outputHTML += "</script>";
        outputHTML += "</form>";
        outputHTML += "</body>";
        outputHTML += "</html>";
        Response.Write(outputHTML);
        Session["oid"] = num;

      
    }
   
    }
