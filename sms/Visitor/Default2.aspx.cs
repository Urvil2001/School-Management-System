using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Visitor_Default2 : System.Web.UI.Page
{
    string username;
    protected void Page_Load(object sender, EventArgs e)
    {
        username = Request.QueryString["username"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string mycon = (@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        string updatedata = "update Login set status=0, lockdatetime=null where username='" + username + "'";
        SqlConnection cn = new SqlConnection(mycon);
        cn.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = updatedata;
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
    }
}