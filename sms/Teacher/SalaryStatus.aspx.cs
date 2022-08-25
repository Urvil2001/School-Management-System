using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_SalaryStatus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select Transactionid,CONVERT(varchar(10),date,110) as PayingDate, (month(date)-1) as MonthSalary,amount as Amount from Feespayment where email='" + Session["username"].ToString() + "'";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();
        sda.SelectCommand = cmd;
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        

    }
}