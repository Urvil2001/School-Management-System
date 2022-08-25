using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_ViewAssignment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        if (!IsPostBack)
        {
        }
        else
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tp where pdfid='" + DropDownList1.SelectedItem.Value + "'";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            r1.DataSource = dt;
            r1.DataBind();
        }
    }
  
       public string checkpdf(object myvalue1, object id1)
    {
        if (myvalue1 == "")
        {
            return "Not Available";
        }
        else
        {
             myvalue1 = "../Data/" + myvalue1.ToString();
            return "<a href='"+myvalue1.ToString()+"' style='color:green'>view Assignment</a>";
        }
    }
    }
   

