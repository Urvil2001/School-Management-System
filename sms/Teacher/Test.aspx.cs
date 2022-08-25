using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_Test : System.Web.UI.Page
{
    int txtboxcount;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\sms\App_Data\Database.mdf;Integrated Security=True;User Instance=True");
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select count(subjectid) from Subject where stdid='11'";
        con.Open();
        cmd.Connection = con;
        txtboxcount = Convert.ToInt16(cmd.ExecuteScalar());
        

        DynamicallyRenderTextBoxes(txtboxcount);       
    }

    protected void DynamicallyRenderTextBoxes(int count)
    {

        for (int i = 0; i < count; i++)
        {
            TextBox tb = new TextBox();
            tb.ID = "textBox_" + i.ToString();
            Panel1.Controls.Add(tb);

            Literal lt = new Literal();
            lt.ID = "lt_" + i.ToString();
            lt.Text = "<br/>";
            Panel1.Controls.Add(lt);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=D:\sms\App_Data\Database.mdf;Integrated Security=True;User Instance=True");

     
        

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.Columns WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME = 'my_test' AND COLUMN_NAME = '"+TextBox1.Text+ "' ) BEGIN ALTER TABLE dbo.my_test ADD "+TextBox1.Text+" INT END";
        con.Open();
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Response.Write("hey");
                //ALTER TABLE my_test ADD " +TextBox1.Text+ " varchar(50)
        

    }
}