using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_TeacherSalaryStatus : System.Web.UI.Page
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
        cmd.CommandText = "select Feespayment.Transactionid,Feespayment.name as Name,CONVERT(varchar(10),Feespayment.date,110) as PayingDate,Feespayment.email as Email,Feespayment.phno as Mobile,amount as Amount,Teacher.salary as Salary from Feespayment Inner JOIN Teacher ON Teacher.emailid=Feespayment.email where (month(date)-1)='" + DropDownList1.SelectedItem.Value + "' ";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd;
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}