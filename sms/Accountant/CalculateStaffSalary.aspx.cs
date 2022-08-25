using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class Accountant_CalculateStaffSalary : System.Web.UI.Page
{
    Random r = new Random();

    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        var date = DateTime.Now;
        var lastmonth = date.AddMonths(-1);
        int last = lastmonth.Month;
        int year = DateTime.Now.Year;
        // Response.Write(last);
        var dayinmonth = DateTime.DaysInMonth(year, last);
        

        id = Request.QueryString["id"].ToString();



        //SqlCommand cmd2 = new SqlCommand();
        //cmd2.CommandText = "select salary from Teacher where id='" + id + "'";
        //cmd2.Connection = con;


        //float salary = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
        //float divide = salary / day;
        //Label1.Text = divide.ToString();
        //int presentdays = day - days;
        //Response.Write(divide * presentdays);


      
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Teacher  where id='" + id + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            tid.Text = id;
            Image1.ImageUrl = ds.Tables[0].Rows[0]["pic"].ToString();
            fname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
            salary.Text = ds.Tables[0].Rows[0]["salary"].ToString();
            email.Text = ds.Tables[0].Rows[0]["emailid"].ToString();
            mob.Text = ds.Tables[0].Rows[0]["ph_no"].ToString();
        }



        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "select count(status) from Attendance where rollno='" + id + "' and status='Absent' and month(date)="+last+"";
        cmd2.Connection = con;
        int AbsentDays = Convert.ToInt16(cmd2.ExecuteScalar());

        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "select count(status) from Attendance where rollno='" + id + "' and status='Present' and month(date)=" + last + "";
        cmd3.Connection = con;
        int Presentdaysforshow = Convert.ToInt16(cmd3.ExecuteScalar());

        SqlCommand cmd4 = new SqlCommand();
        cmd4.CommandText = "select count(status) from Attendance where rollno='" + id + "' and status='Leave' and month(date)=" + last + "";
        cmd4.Connection = con;
        int Leave = Convert.ToInt16(cmd4.ExecuteScalar());


        
        int month = DateTime.Now.Month;
        int currentmonthdays = DateTime.DaysInMonth(year, last);
        int presentdays = currentmonthdays - AbsentDays;
        if (presentdays == 0 && AbsentDays == 0)
        {
            error.Style.Add("display", "block");
            Label5.Text = "No record found about Present & Absent Days...";
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            Button1.Visible = false;
            Label1.Visible = false;
        }

        Label2.Text="Working Days in " +last+" Month is= " +  Presentdaysforshow.ToString() + " Days ";
        Label3.Text ="Absent Days in " +last+" Month is= "+ AbsentDays.ToString() + " Days ";
        Label1.Text = "Leave Days in " + last + " Month is= " + Leave.ToString() + " Days ";
        int pending = currentmonthdays - presentdays - AbsentDays;

        float counting = Convert.ToInt64(salary.Text);
        float countsalary =counting/dayinmonth;
        TextBox1.Text = Convert.ToString(countsalary * presentdays);

        if (pending > 0)
        {
            Label4.Text = "There are " + pending + " day is pending ";
        }
        else
        {
            Label4.Visible = false;
        }


        SqlCommand cmd5 = new SqlCommand();
        cmd5.CommandText = "select CONVERT(varchar(10),date,110) as date,status from Attendance where rollno='" + tid.Text + "' and month(date)=" + last + " ";
        cmd5.Connection = con;
        cmd5.ExecuteNonQuery();
        SqlDataAdapter sda2=new SqlDataAdapter();
        sda2.SelectCommand = cmd5;
        DataSet ds2 = new DataSet();
        sda2.Fill(ds2);
        GridView1.DataSource = ds2;
        GridView1.DataBind();


        int currentmonth = DateTime.Now.Month;
        SqlCommand cmd6 = new SqlCommand();
        cmd6.CommandText = "select count(email) from Feespayment where month(date)='" + currentmonth + "' and email='" + email.Text + "'";
        cmd6.Connection = con;
        int found = Convert.ToInt16(cmd6.ExecuteScalar());
        if (found > 0)
        {
            Button1.Visible = false;
            Button2.Visible = false;
            Image2.Visible = true;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Panel1.Visible = false;
        Panel2.Visible = true;
       

        
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (online.Checked == false && offline.Checked == false)
        {
            Response.Write("<script>alert('Please Select Any Payment Method')</script>");
        }
        else
        {
            if (online.Checked == true)
            {
                string std = "-";
                HttpCookie Cookie = new HttpCookie("Username");
                Cookie.Values.Add("std", std);
                Cookie.Values.Add("name", fname.Text);
                Cookie.Values.Add("rupee", TextBox1.Text);
                Cookie.Values.Add("email", email.Text);
                Cookie.Values.Add("mob", mob.Text);
                Cookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(Cookie);


                string num = r.Next().ToString();
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
                parameters.Add("ORDER_ID", num);
                parameters.Add("TXN_AMOUNT", TextBox1.Text);
                parameters.Add("CALLBACK_URL", "http://localhost:55102/sms/Student/callback.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.

                string checksum = paytm.CheckSum.generateCheckSum(merchantKey, parameters);
                string paytmURL = "https://securegw-stage.paytm.in/order/process?orderid=" + num;


                string outputHTML = "<html>";
                outputHTML += "<head>";
                outputHTML += "<title>Merchant Check Out Page</title>";
                outputHTML += "</head>";
                outputHTML += "<body>";
                outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";

                outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
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
            else if (offline.Checked == true)
            {
                Random r = new Random();
                int trans = Convert.ToInt32(r.Next(0, 100000).ToString("D6"));
                string fullname = fname.Text;
                string std = "-";
                SqlCommand cmd = new SqlCommand();
                string time = DateTime.Now.ToShortDateString();
                cmd.CommandText = "insert into Feespayment(Transactionid,name,date,std,phno,email,amount,rollid) values(" + trans + ",'" + fullname + "','" + time + "','" + std + "','" + mob.Text + "','" + email.Text + "','" + TextBox1.Text + "',3)";
                cmd.Connection = con;
                cmd.ExecuteNonQuery();


                HttpCookie Cookie = new HttpCookie("Username");
                Cookie.Values.Add("name", fullname);
                Cookie.Values.Add("rupee", salary.Text);
                Cookie.Values.Add("email", email.Text);
                Cookie.Values.Add("std", std);
                Cookie.Values.Add("mob", mob.Text);
                Cookie.Values.Add("txn", trans.ToString());
                Cookie.Expires = DateTime.Now.AddHours(1);
                Response.Cookies.Add(Cookie);
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Paying Fees of " + fname.Text + " Successfully  ');window.location='Receipt.aspx';", true);

            }
        }
    }
}