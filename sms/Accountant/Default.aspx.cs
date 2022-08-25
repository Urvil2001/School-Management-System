using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Accountant_Default : System.Web.UI.Page
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
        cmd.CommandText = "select sum(amount) from Feespayment where rollid='2'";
        cmd.Connection = con;
        int earn =Convert.ToInt32(cmd.ExecuteScalar());
        Literal1.Text = earn.ToString();


        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select sum(amount) from Feespayment where rollid='3'";
        cmd1.Connection = con;
        int spend = Convert.ToInt32(cmd1.ExecuteScalar());
        Literal2.Text = spend.ToString();
    }
}