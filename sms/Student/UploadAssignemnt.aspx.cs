using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
public partial class Student_UploadAssignemnt : System.Web.UI.Page
{
    string date1;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(Server.MapPath("~/Data/" + Path.GetFileName(FileUpload1.FileName)));
        string filename = "~/Data/" + Path.GetFileName(FileUpload1.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);

                string query = "insert into tp values (@Name,@rollno,@pdfid,@ContentType, @Data)";
                SqlCommand cmd = new SqlCommand();

                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Name", Session["uname"]);
                cmd.Parameters.AddWithValue("@rollno", Session["roll"]);
                cmd.Parameters.AddWithValue("@pdfid", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ContentType", FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@Data", bytes);
                cmd.CommandText = query;
                
                cmd.ExecuteNonQuery();
                

            }
        }
    }
    protected void DropDownList1_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_TextChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        
        int hey = 32;
        cmd.CommandText = "select duedate from PDFfiles where name='" + DropDownList1.SelectedItem.Text + "'";
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            date1 = dr["duedate"].ToString();

        }
        
        DateTime dt = Convert.ToDateTime(date1);
        var dateandtime = DateTime.Now;
        var d = dateandtime.Date;
        int date = Convert.ToInt16((dt - d).TotalDays);
        Label1.Text = date.ToString();
        if (date > 0)
        {
            Label2.Visible = true;
            FileUpload1.Visible = true;
            Button1.Visible = true;
        }
        else
        {
            Label2.Visible = false;
            FileUpload1.Visible = false;
            Button1.Visible = false;
            Response.Write("<script>alert('Sorry You cant Submit your assignment because of duedate is over')</script>");
        }

    }
}