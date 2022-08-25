using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using paytm;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;
public partial class Accountant_Callback : System.Web.UI.Page
{
    string txtId;
    string name;
    string std;
    string mob;
    string rupee;
    string email;
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
            string merchantKey = "s8cIUB!24FJY5@!5";

            Dictionary<string, string> parameters = new Dictionary<string, string>();
            string paytmchecksum = "";


            foreach (string key in Request.Form.Keys)
            {
                parameters.Add(key.Trim(), Request.Form[key].Trim());
            }

            if (parameters.ContainsKey("CHECKSUMHASH"))
            {
                paytmchecksum = parameters["CHECKSUMHASH"];
                parameters.Remove("CHECKSUMHASH");
            }
            if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmchecksum))
            {
                string paytmstatus = parameters["STATUS"];
                txtId = parameters["TXNID"];
                pTxnId.InnerText = "Transaction Id:" + txtId;

                if (paytmstatus == "TXN_SUCCESS")
                {
                    if (Request.Cookies["Username"] != null)
                    {
                        std = Request.Cookies["Username"]["std"];
                        //Label1.Text = std;
                        name = Request.Cookies["Username"]["name"];
                        //Label2.Text = name;
                        mob = Request.Cookies["Username"]["mob"];
                        //Label3.Text = mob;
                        rupee = Request.Cookies["Username"]["rupee"];
                        //Label4.Text = rupee;
                        email = Request.Cookies["Username"]["email"];
                        //Label5.Text = email;


                    }
                    h1Message.InnerText = "Your payment is success";
                    var dateAndTime = DateTime.Now;
                    Label8.Text = Convert.ToString(dateAndTime.ToShortDateString());

                    SqlCommand cmd = new SqlCommand();

                    //DateTime dt = new DateTime();
                    //dt = DateTime.Now;
                    cmd.CommandText = "insert into Feespayment(Transactionid,name,date,std,phno,email,amount,rollid) values ('" + txtId + "','" + name + "','" + Label8.Text + "','" + std + "','" + mob + "','" + email + "','" + rupee + "','3')";
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();

                    showgrid(txtId);


                    



                }
                else if (paytmstatus == "PENDING")
                {
                    h1Message.InnerText = "Your payment is pending";

                }
                else if (paytmstatus == "TXN_FAILURE")
                {
                    h1Message.InnerText = "Your payment is Failed";
                    Panel1.Visible = false;
                }
            }
            else
            {
                Response.Write("Checksum MisMatch");
            }
        }
    }


    public void showgrid(string txnid)
    {
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add("Transactionid");
        dt.Columns.Add("name");
        dt.Columns.Add("std");
        dt.Columns.Add("phno");
        dt.Columns.Add("email");
        dt.Columns.Add("amount");

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from Feespayment where Transactionid='" + txtId + "'";
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        int totalrows = ds.Tables[0].Rows.Count;
        int i = 0;
        string amount = "0";
        while (i < totalrows)
        {
            dr = dt.NewRow();
            dr["Transactionid"] = ds.Tables[0].Rows[i]["Transactionid"].ToString();
            dr["name"] = ds.Tables[0].Rows[i]["name"].ToString();
            dr["std"] = ds.Tables[0].Rows[i]["std"].ToString();
            dr["phno"] = ds.Tables[0].Rows[i]["phno"].ToString();
            dr["email"] = ds.Tables[0].Rows[i]["email"].ToString();
            amount = ds.Tables[0].Rows[i]["amount"].ToString();
            dr["amount"] = amount;
            dt.Rows.Add(dr);
            i = i + 1;
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
        Label10.Text = amount.ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        exportpdf();

    }
    private void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();


    }
    //to over ride the probleb of grid view runat
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }
}