using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_MasterPage : System.Web.UI.MasterPage
{
    public static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/Visitor/Login.aspx");

        }
        else
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = cn.ConnectionString = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True";
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
            SqlCommand cmd2 = new SqlCommand();
            cmd.CommandText = "select * from Teacher where emailid='" + Session["username"] + "'";

            cmd.Connection = cn;

            SqlDataAdapter sda = new SqlDataAdapter();

            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);


            if (ds.Tables[0].Rows.Count > 0)
            {
                string uname = ds.Tables[0].Rows[0]["fname"].ToString();
                string photo = ds.Tables[0].Rows[0]["pic"].ToString();
                Session["email"] = ds.Tables[0].Rows[0]["emailid"].ToString();

                Session["uname"] = uname;

                string std = ds.Tables[0].Rows[0]["standard"].ToString();
                Session["std"] = std;
                id = Convert.ToInt32(ds.Tables[0].Rows[0]["id"]);
                Session["id"] = id;
                string subject = ds.Tables[0].Rows[0]["subjectname"].ToString();
                Session["subject"] = subject;
            }
            cmd1.CommandText = "select standardid,division from class where teacherid=" + id + "";
            cmd1.Connection = cn;
            SqlDataAdapter sda1 = new SqlDataAdapter();
            sda1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            sda1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                string div = ds1.Tables[0].Rows[0]["division"].ToString();
                Session["div"] = div;


            }


            cmd2.CommandText = "select subjectid from Subject where subjectname='" + Session["subject"].ToString() + "' and stdid='" + Session["std"] + "'";
            cmd2.Connection = cn;
            SqlDataAdapter sda2 = new SqlDataAdapter();
            sda2.SelectCommand = cmd2;
            DataSet ds2 = new DataSet();
            sda2.Fill(ds2);
            if (ds2.Tables[0].Rows.Count > 0)
            {
                string subid = ds2.Tables[0].Rows[0]["subjectid"].ToString();
                Session["subid"] = subid;


            }
        }

            }
        }


