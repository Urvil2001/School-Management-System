using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
public partial class Teacher_UploadAssignment : System.Web.UI.Page
{
    String d1;
    long d2;
    string d3;
    string u;
    long r;
    string v;
    string date;
    string name;
    string ext;
    public static int subjectid;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State == ConnectionState.Open)
        {
            con.Close();
        }
        con.Open();

        DataTable dt = new DataTable();
        dt.Columns.Add("File");
        dt.Columns.Add("Size");
        dt.Columns.Add("Type");
        dt.Columns.Add("Date");



        foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Data")))
        {
            FileInfo fi = new FileInfo(strfile);
            dt.Rows.Add(fi.Name, fi.Length.ToString(),
            GetFileTypeByExtension(fi.Extension), fi.CreationTime.ToString());



        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        save();
    }

    public void save()
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Data/") + Path.GetFileName(FileUpload1.FileName));
            FileInfo f = new FileInfo(FileUpload1.FileName);
            u = f.Name;
            r = FileUpload1.FileName.Length;
            v = GetFileTypeByExtension(f.Extension);
            date = f.CreationTime.ToString();
        }

        DataTable dt = new DataTable();
        dt.Columns.Add("File");
        dt.Columns.Add("Size");
        dt.Columns.Add("Type");
        dt.Columns.Add("Date");
        foreach (string strfile in Directory.GetFiles(Server.MapPath("~/Data")))
        {
            FileInfo fi = new FileInfo(strfile);

            dt.Rows.Add(fi.Name, fi.Length.ToString(),
            GetFileTypeByExtension(fi.Extension), fi.CreationTime.ToString());
            d1 = fi.Name;
            d2 = fi.Length;
            d3 = fi.Extension;


        }
          SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
      
        Label3.Text = System.DateTime.Now.ToString();
        Label3.Visible = false;

        cmd1.CommandText = "select subjectid from Subject where stdid='" + Session["std"] + "' AND subjectname='" + Session["subject"] + "' ";
        cmd1.Connection = con;

        SqlDataAdapter sda = new SqlDataAdapter();

        sda.SelectCommand = cmd1;
        DataSet ds = new DataSet();
        sda.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            subjectid = Convert.ToInt32(ds.Tables[0].Rows[0]["subjectid"].ToString());
        }

        cmd.CommandText = "insert into PDFfiles(name,type,data,std,date,duedate,subjectid) values ( '" + u + "','" + v + "'," + r + "," + Session["std"] + ",'" + Label3.Text + "','" + ddate.Text + "'," + subjectid + ")";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
       
        GridView1.DataSource = dt;
        GridView1.DataBind();




    }
    private string GetFileTypeByExtension(string fileExtension)
    {
        switch (fileExtension.ToLower())
        {
            case ".docx":
            case ".doc":
                return "Microsoft Word Document";
            case ".xlsx":
            case ".xls":
                return "Microsoft Excel Document";
            case ".txt":
                return "Text Document";
            case ".jpg":
            case ".png":
                return "Image";
            case ".pdf":
                return "PDF";
            default:
                return "Unknown";
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename="
            + e.CommandArgument);
        Response.TransmitFile(Server.MapPath("~/Data/")
            + e.CommandArgument);
        Response.End();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
}