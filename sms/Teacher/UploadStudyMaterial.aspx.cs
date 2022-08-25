using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
public partial class Teacher_UploadStudyMaterial : System.Web.UI.Page
{
    string name;
    string ext;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            GridView2.DataBind();
        }
    }
    protected void b1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Data/") + Path.GetFileName(FileUpload1.FileName));
            FileInfo f = new FileInfo(FileUpload1.FileName);
            name = f.Name;
            ext = GetFileTypeByExtension(f.Extension);
        }

        SqlCommand cmd = new SqlCommand();

        con.Open();
        cmd.CommandText = "insert into Study_Material(name,type,std,subjectid) values ( '" + name + "','" + ext + "'," + Convert.ToInt16(Session["std"].ToString()) + "," + Convert.ToInt16(Session["subid"].ToString()) + ")";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
      
        error.Style.Add("display", "block");
        Label1.Text = "File Uploaded...";
        con.Close();
        
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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename="
            + e.CommandArgument);
        Response.TransmitFile(Server.MapPath("~/Data/")
            + e.CommandArgument);
        Response.End();
    }
}