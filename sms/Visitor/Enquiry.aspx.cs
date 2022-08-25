using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Visitor_Enquiry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        date.Text = DateTime.Now.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into Enquiry(studentname,email,mobno,date,query,status) values ('" + name.Text + "','" + email.Text + "'," + mobno.Text + ",'" + date.Text + "','" + TextBox1.Text + "','Under Processing')";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
    }
}