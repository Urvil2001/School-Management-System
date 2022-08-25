using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Student_Student : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        if (Session["username"] == null)
        {
            Response.Redirect("~/Visitor/Login.aspx");
        }
        else
        {

            
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd1 = new SqlCommand();
            cmd.CommandText = "select * from Student where email='" + Session["username"] + "'";
            cmd1.CommandText = "select activation from Login where username='" + Session["username"] + "'";
            cmd.Connection = con;
            cmd1.Connection = con;
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlDataAdapter sda1 = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            sda1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            sda1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                string status = ds1.Tables[0].Rows[0]["activation"].ToString();
                if (status == "no")
                {
                    Response.Redirect("~/Student/FeesPayment.aspx");
                }

                else if (ds.Tables[0].Rows.Count > 0)
                {
                    string uname = ds.Tables[0].Rows[0]["fname"].ToString();
                    string photo = ds.Tables[0].Rows[0]["studentphoto"].ToString();
                    Session["photo"] = photo;
                    Session["email"] = ds.Tables[0].Rows[0]["email"].ToString();
                  //  Label1.Text = "Welcome" + ", " + uname;
                    Session["uname"] = uname;
                    //Image1.ImageUrl = photo;
                    string std = ds.Tables[0].Rows[0]["std"].ToString();
                    Session["std"] = std;
                    int enroll = Convert.ToInt32(ds.Tables[0].Rows[0]["Enrollmentno"].ToString());
                    Session["enroll"] = enroll;
                    string roll = ds.Tables[0].Rows[0]["roll"].ToString();
                    Session["roll"] = roll;
                    string div = ds.Tables[0].Rows[0]["div"].ToString();
                    Session["div"] = div;
                }
            }

        }
        SqlCommand cmd5 = con.CreateCommand();
        cmd5.CommandType = CommandType.Text;
        cmd5.CommandText = "select * from Announcement where std='"+Session["std"]+"' and placed='No'";
        cmd5.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd5);
        da.Fill(dt);
        count = Convert.ToInt32(dt.Rows.Count.ToString());
        notification1.Text = count.ToString();
        notification2.Text = count.ToString();
        r1.DataSource = dt;
        r1.DataBind();

    }
    public string gettwenrycharacters(object myvalues)
    {
        string a;
        a = Convert.ToString(myvalues.ToString());
        string b = "";

        if (a.Length >= 15)
        {
            b = a.Substring(0, 15);
            return b.ToString() + "..";
        }
        else
        {
            b = a.ToString();
            return b.ToString();
        }
    }
}
