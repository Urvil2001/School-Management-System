using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Accountant_Receipt : System.Web.UI.Page
{
    string txtId;
    string name;
    string std;
    string mob;
    string rupee;
    string email;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

          if (Request.Cookies["Username"] != null)
        {
            std = Request.Cookies["Username"]["std"];
            //Label1.Text = std;
            name = Request.Cookies["Username"]["name"];
            //Label2.Text = name;
            mob = Request.Cookies["Username"]["mob"];
            //Label3.Text = mob;
            rupee = Request.Cookies["Username"]["rupee"];
            //Label4.Text = rupee;
            email = Request.Cookies["Username"]["email"];
            //Label5.Text = email;
            txtId = Request.Cookies["Username"]["txn"];

        }
        //h1Message.InnerText = "Your payment is success";
        var dateAndTime = DateTime.Now;
        Label8.Text = Convert.ToString(dateAndTime.ToShortDateString());
        //SqlConnection cn = new SqlConnection();
        //cn.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=C:\\Users\\Dell\\Desktop\\Finalschoolmanagementsystem\\App_Data\\Database.mdf;Integrated Security=True;User Instance=True";
        //SqlCommand cmd = new SqlCommand();
        //cn.Open();
        //DateTime dt = new DateTime();
        //dt = DateTime.Now;
        // cmd.CommandText = "insert into Feespayment(Transactionid,name,date,std,phno,email,amount) values ('" + txtId + "','" + name + "','" + Label8.Text + "','" + std + "','" + mob + "','" + email + "','" + rupee + "')";
        //cmd.Connection = cn;
        //cmd.ExecuteNonQuery();
        //cn.Close();
        showgrid(txtId);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = Panel1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        Button1.Visible = false;
    }

    public void showgrid(string txnid)
    {
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add("Transactionid");
        dt.Columns.Add("name");
        dt.Columns.Add("std");
        dt.Columns.Add("phno");
        dt.Columns.Add("email");
        dt.Columns.Add("amount");
      
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Feespayment where Transactionid='" + txtId + "'";
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        string amount = "0";
        while (i < totalrows)
        {
            dr = dt.NewRow();
            dr["Transactionid"] = ds.Tables[0].Rows[i]["Transactionid"].ToString();
            dr["name"] = ds.Tables[0].Rows[i]["name"].ToString();
            dr["std"] = ds.Tables[0].Rows[i]["std"].ToString();
            dr["phno"] = ds.Tables[0].Rows[i]["phno"].ToString();
            dr["email"] = ds.Tables[0].Rows[i]["email"].ToString();
            amount = ds.Tables[0].Rows[i]["amount"].ToString();
            dr["amount"] = amount;
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        Label10.Text = amount.ToString();
    }
}