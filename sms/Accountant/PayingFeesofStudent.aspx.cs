using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Accountant_PayingFeesofStudent : System.Web.UI.Page
{
    string rupee;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        SqlCommand cmd5 = new SqlCommand();
        cmd5.CommandText = "select * from Student where Enrollmentno='" + TextBox1.Text + "'";

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
            email.Text = ds2.Tables[0].Rows[0]["email"].ToString();
            // Response.Cookies["sta"].Value = std.Text;
            SqlCommand cmd6 = new SqlCommand();
            cmd6.CommandText = "select ((admissionfee+(tutionfee*12))/4)as 'sum' from Feesstructure where standard='" + std.Text + "'";
            cmd6.Connection = con;

            object total = cmd6.ExecuteScalar();
            rupee = total.ToString();
            SqlCommand cmd7 = new SqlCommand();
            cmd7.CommandText = "select sum(amount) from Feespayment where email='" + email.Text + "' group by email";
            cmd7.Connection = con;
            object total1 = cmd7.ExecuteScalar();

            int am = Convert.ToInt32(total1);
            int r = Convert.ToInt32(rupee);
            int rs = r * 4;
            Label1.Text = (rs - am).ToString();
            if (Label1.Text == "0")
            {
                Button2.Visible = false;
            }
            else { Button2.Visible = true; }
            fname.Text = ds2.Tables[0].Rows[0]["fname"].ToString();



            //Response.Cookies["em"].Value = email.Text;
            mob.Text = ds2.Tables[0].Rows[0]["phno"].ToString();
            //Response.Cookies["mo"].Value = mob.Text;
            error.Visible = false;


        }
        else
        {
            error.Visible = true;
            error.Style.Add("display", "block");
            Label2.Text = "No record is found...";
            Panel1.Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Random r = new Random();
        int trans = Convert.ToInt32(r.Next(0, 100000).ToString("D6"));
        string fullname = fname.Text + " " + mname.Text + " " + lname.Text;
        SqlCommand cmd = new SqlCommand();
        string time = DateTime.Now.ToShortDateString();
        cmd.CommandText = "insert into Feespayment values(" + trans + ",'" + fullname + "','" + time + "','" + std.Text + "','" + mob.Text + "','" + email.Text + "','" + amount.Text + "','2')";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        
        HttpCookie Cookie = new HttpCookie("Username");
        Cookie.Values.Add("std", std.Text);
        Cookie.Values.Add("name", fullname);
        Cookie.Values.Add("rupee", rupee);
        Cookie.Values.Add("email", email.Text);
        Cookie.Values.Add("mob", mob.Text);
        Cookie.Values.Add("txn", trans.ToString());
        Cookie.Expires = DateTime.Now.AddHours(1);
        Response.Cookies.Add(Cookie);
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Paying Fees of " + fname.Text + " Successfully  ');window.location='Receipt.aspx';", true);

    }
}