using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Admin_ReplyLeaveApplicationOfTeacher : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    string name;
    string date;
    string s = "Leave";
    int std;

    string roll;
    string div;
    int noofdays;
    string lastdate;
    DateTime startdate;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        if (!IsPostBack)
        {
            GridView1.DataSource = SqlDataSource2;
            GridView1.DataBind();
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox status = (row.FindControl("CheckBox1") as CheckBox);
            int applicationid = Convert.ToInt32(row.Cells[1].Text);
            name = row.Cells[3].Text;
            date = row.Cells[6].Text;
            roll = row.Cells[2].Text;
            noofdays = Convert.ToInt16(row.Cells[7].Text);
            noofdays = noofdays - 1;
            startdate = Convert.ToDateTime(date);
            lastdate = (startdate.AddDays(noofdays).ToShortDateString());

            std =Convert.ToInt16(row.Cells[4].Text);
            if (status.Checked)
            {
                updaterow(applicationid, "Accept");
            }
            else
            {
                updaterow(applicationid, "Decline");
            }
        }
        Response.Write("<script>alert('Application has been approved..')</script>");
        SqlDataSource2.DataBind();
        GridView1.DataSource = SqlDataSource2;
        
    }
    public void updaterow(int appllicationid, String approval)
    {

        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "update Leave_application set status='" + approval + "' where leaveapplicationid=" + appllicationid + "";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        if (approval == "Accept")
        {
            for (DateTime date1 = startdate; date1 <= Convert.ToDateTime(lastdate); date1 = date1.AddDays(1))
            {
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "insert into Attendance(name,date,status,std,rollno,rollid)  values ('" + name + "','" + date1 + "','" + s + "'," + std + ",'" + roll + "','3')";
                cmd1.Connection = con;
                cmd1.ExecuteNonQuery();
            }
        }
    }
}