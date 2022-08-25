using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Student_YourResult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        string status="";
      
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select Status from Result where rollno='" + Session["roll"] + "'";
        cmd1.Connection = con;
        SqlDataAdapter sda1 = new SqlDataAdapter();
        sda1.SelectCommand = cmd1;
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            status = ds1.Tables[0].Rows[0]["Status"].ToString();
           
        }
        if (status == "no")
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            error.Style.Add("display", "block");
            Label2.Text = "Result is not Declare...";
        }
        else
        {
            Label2.Visible = false;
            string mark = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                string subjectname = GridView1.Rows[i].Cells[0].Text;
                //string mark =Convert.ToString(GridView1.Rows[i].FindControl("TextBox2") as TextBox);
                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = "select * from Result where rollno='" + Session["roll"] + "'";
                cmd.Connection = con;
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    mark = ds.Tables[0].Rows[0][subjectname].ToString();
                    (GridView1.Rows[i].FindControl("Label1") as Label).Text = ds.Tables[0].Rows[0][subjectname].ToString();
                }


            

            }
        }
    }
}