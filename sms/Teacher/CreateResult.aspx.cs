using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_CreateResult : System.Web.UI.Page
{
    int txtboxcount;
    int id;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
        string findid;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select fname,mname,lname,roll,studentphoto from Student where Enrollmentno='" + Request.QueryString["id"].ToString() + "'";
        cmd.Connection = con;
        SqlDataAdapter sda1 = new SqlDataAdapter();
        sda1.SelectCommand = cmd;
        DataSet ds1 = new DataSet();
        sda1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            fname.Text = ds1.Tables[0].Rows[0]["fname"].ToString();
            mname.Text = ds1.Tables[0].Rows[0]["mname"].ToString();
            lname.Text = ds1.Tables[0].Rows[0]["lname"].ToString();
            Image1.ImageUrl = ds1.Tables[0].Rows[0]["studentphoto"].ToString();
            Label1.Text = ds1.Tables[0].Rows[0]["roll"].ToString();
            
        }

        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select max(id) from Result";
        cmd1.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = cmd1;
        DataSet ds = new DataSet();
        sda.Fill(ds);
      
            findid = ds.Tables[0].Rows[0][0].ToString();
            id = Convert.ToInt16(findid);
            id = id + 1;

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandText = "select count(id) from Result where rollno='" + Label1.Text + "'";
            cmd3.Connection = con;
          
            int already = Convert.ToInt16(cmd3.ExecuteScalar());

            if (already > 0)
            {
                string mark;
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    string subjectname = GridView1.Rows[i].Cells[0].Text;
                    //string mark =Convert.ToString(GridView1.Rows[i].FindControl("TextBox2") as TextBox);
                    SqlCommand cmd4 = new SqlCommand();

                    cmd4.CommandText = "select * from Result where rollno='" + Label1.Text + "'";
                    cmd4.Connection = con;
                    SqlDataAdapter sda2 = new SqlDataAdapter();
                    sda2.SelectCommand = cmd4;
                    DataSet ds2 = new DataSet();
                    sda2.Fill(ds2);
                    if (ds2.Tables[0].Rows.Count > 0)
                    {
                        mark = ds2.Tables[0].Rows[0][subjectname].ToString();
                        (GridView1.Rows[i].FindControl("TextBox2") as TextBox).Text = ds2.Tables[0].Rows[0][subjectname].ToString();
                    }


                    

                }
            }
    }
    
    protected void GetTextBoxValues(object sender, EventArgs e)
    {
        
        SqlCommand cmd3 = new SqlCommand();
        string fullname=fname.Text+" "+mname.Text+" "+lname.Text;
        cmd3.CommandText = "insert into Result(id,rollno,name,std) values (" + id + ",'"+Label1.Text+"','"+fullname+"','"+Convert.ToString(Session["std"])+"') ";
        cmd3.Connection = con;
        cmd3.ExecuteNonQuery();
        int gtotal=0;
        
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            string total =(GridView1.Rows[i].FindControl("TextBox2") as TextBox).Text;
            gtotal +=Convert.ToInt16(total);

        }
        Panel1.Visible = true;
        TextBox3.Text = gtotal.ToString();
        float sum = Convert.ToInt16(TextBox3.Text);
        float totalsub = Convert.ToInt16(TextBox1.Text);
        float perc = ((sum*100) / totalsub) ;
        TextBox4.Text = Convert.ToString(perc) + "%";
        
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            string name = GridView1.Rows[i].Cells[0].Text;
            string mark = (GridView1.Rows[i].FindControl("TextBox2") as TextBox).Text;
            SqlCommand cmd = new SqlCommand();
           
            cmd.CommandText = "update Result SET " + name + "='" + mark + "' where id="+id+"";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

        }
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "update Result SET Total='"+totalsub+"',Sum='"+sum+"',Percentage='"+perc+"',Status='no' where id="+id+"";
        cmd1.Connection = con;
        cmd1.ExecuteNonQuery();
    }


}
