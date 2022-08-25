using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Text;
public partial class Teacher_MarkAttendanceofStudent : System.Web.UI.Page
{
    static string rollno1;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    string statuslocal;
    string roll;
    string name;
    string namecom;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();


        if (!Page.IsPostBack)
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Student where std='"+Session["std"]+"'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            foreach (GridViewRow row in GridView1.Rows)
            {
                string todaydate=DateTime.Now.ToShortDateString();
                roll = row.Cells[1].Text;
                name = row.Cells[2].Text;
                DropDownList rbtn1 = (row.Cells[4].FindControl("DropDownList2") as DropDownList);
                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = "select status,name from Attendance where rollno='" + roll + "' and date='" + todaydate + "'";
                cmd2.Connection = con;
                SqlDataAdapter sda1 = new System.Data.SqlClient.SqlDataAdapter();
                sda1.SelectCommand = cmd2;
                DataSet ds = new System.Data.DataSet();
                sda1.Fill(ds);
                
                if (ds.Tables[0].Rows.Count > 0)
                {
                    statuslocal = ds.Tables[0].Rows[0]["status"].ToString();
                    namecom = ds.Tables[0].Rows[0]["name"].ToString();
                    if (statuslocal == "Present" && name == namecom)
                    {
                        rbtn1.SelectedValue = "1";
                    }
                    else if (statuslocal == "Absent" && name == namecom)
                    {
                        rbtn1.SelectedValue = "2";
                    }
                    else if (statuslocal == "Leave" && name == namecom)
                    {
                        rbtn1.SelectedValue = "3";
                    }
                    else
                    {
                        rbtn1.SelectedValue = "0";
                    }
                }
                else
                {
                    rbtn1.SelectedValue = "0";
                }


               

            }
        
            
        }  
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DateTime todaydate=DateTime.Now.Date;
        SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
        cmd.CommandText = "select count(name) from Attendance where date='" + todaydate + "'";
        cmd.Connection = con;
        int count = Convert.ToInt16(cmd.ExecuteScalar());
        if (count >= 1)
        {
            SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand();
            cmd2.CommandText = "DELETE FROM Attendance where date='" + todaydate + "' and rollid='2'";
            cmd2.Connection = con;
            cmd2.ExecuteNonQuery();
            foreach (GridViewRow row in GridView1.Rows)
            {
                string name1 = row.Cells[2].Text;
                rollno1 = row.Cells[1].Text;

                DropDownList rbtn1 = (row.Cells[4].FindControl("DropDownList2") as DropDownList);


                string dateofclass1 = DateTime.Now.ToShortDateString();
                string sClass1 = row.Cells[3].Text;
                saveattendance(rollno1, name1, dateofclass1, rbtn1.SelectedItem.Text, sClass1);
            }
            error.Style.Add("display", "block");
            Label1.Text = "Attendance Updated";
        }
        else
        {

            foreach (GridViewRow row in GridView1.Rows)
            {
                string name1 = row.Cells[2].Text;
                rollno1 = row.Cells[1].Text;

                DropDownList rbtn1 = (row.Cells[4].FindControl("DropDownList2") as DropDownList);


                string dateofclass1 = DateTime.Now.ToShortDateString();
                string sClass1 = row.Cells[3].Text;
                saveattendance(rollno1, name1, dateofclass1, rbtn1.SelectedItem.Text, sClass1);
            }
            error.Style.Add("display", "block");
            Label1.Text = "Attendance Saved";
        }
    }
    private void saveattendance(string id, string name, string dateofclass, string status, string std)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into Attendance(name,date,status,std,rollno,rollid) values('" + name + "','" + dateofclass + "','" + status + "','" + std + "','" + id + "','2') ";

        cmd.Connection = con;
        cmd.ExecuteNonQuery();

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DateTime date=DateTime.Now;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList d1 = (e.Row.FindControl("DropDownList2") as DropDownList);
            d1.DataSource = "select status from Leave_application where rollno='" + rollno1 + "' and date='" + date + "'";
            d1.DataTextField = "status";
            d1.DataValueField = "status";
            d1.DataBind();
        }
    }
}