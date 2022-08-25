using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_LeaveCertificate : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
       if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        
        string fname;
        string mname;
        string lname;
        SqlCommand cmd=new SqlCommand();
        cmd.CommandText = "select fname,mname,lname,CONVERT(varchar(10),dob,110) as date,std from Student where Enrollmentno='" + Convert.ToString(Request.QueryString["ID"]) + "'";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            fname = ds.Tables[0].Rows[0]["fname"].ToString();
            mname = ds.Tables[0].Rows[0]["mname"].ToString();
            lname = ds.Tables[0].Rows[0]["lname"].ToString();
            Label1.Text = fname + " " + mname + " " + lname;
            Label2.Text = ds.Tables[0].Rows[0]["date"].ToString();
            Label4.Text = DateTime.Now.ToShortDateString();
            Label6.Text = ds.Tables[0].Rows[0]["std"].ToString();
            DateTime dt = Convert.ToDateTime(ds.Tables[0].Rows[0]["date"].ToString());
            int year = dt.Year;
            int date = dt.Day;
            int monthfind = dt.Month;
            DateTime month = new DateTime(year, monthfind, date);
            string monthname = month.ToString("MMMM");
            Label7.Text = ConvertNumbertoWords(year);
            
            Label3.Text = ConvertNumbertoWords(date) +" "+ monthname.ToUpper();

        }

    }
    public static string ConvertNumbertoWords(int number)
{
if (number == 0)
return "ZERO";
if (number < 0)
return "minus " + ConvertNumbertoWords(Math.Abs(number));
string words = "";
if ((number / 1000000) > 0)
{
words += ConvertNumbertoWords(number / 1000000) + " MILLION ";
number %= 1000000;
}
if ((number / 1000) > 0)
{
words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
number %= 1000;
}
if ((number / 100) > 0)
{
words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
number %= 100;
}
if (number > 0)
{
if (words != "")
words += "AND ";
var unitsMap = new[] { "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN" };
var tensMap = new[] { "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY" };

if (number < 20)
words += unitsMap[number];
else
{
words += tensMap[number / 10];
if ((number % 10) > 0)
words += " " + unitsMap[number % 10];
}
}
return words;
}
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = Panel1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        
    }
}


