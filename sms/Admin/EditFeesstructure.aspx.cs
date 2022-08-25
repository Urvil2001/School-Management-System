using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_EditFeesstructure : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();



        if (IsPostBack) return;
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt16(Request.QueryString["id"].ToString());
            string myquery = "select * from Feesstructure where standard='" + id + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                std.Text = ds.Tables[0].Rows[0]["standard"].ToString();
                afee.Text = ds.Tables[0].Rows[0]["admissionfee"].ToString();
                tfee.Text = ds.Tables[0].Rows[0]["tutionfee"].ToString();

            }
        }
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd2 =new SqlCommand();
        cmd2.CommandText = "update Feesstructure set admissionfee=" + afee.Text + ",tutionfee=" + tfee.Text + " where standard=" + std.Text + "";
        cmd2.Connection = con;
        cmd2.ExecuteNonQuery();
        error.Style.Add("display", "block");
        Label1.Text = "Record Updated..";

    }
}