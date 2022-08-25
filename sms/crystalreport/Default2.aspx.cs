using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;

public partial class crystalreport_Default2 : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Database.mdf;Integrated Security=True;User Instance=True");
        DataSet2 ds = new DataSet2();
        SqlDataAdapter da = new SqlDataAdapter("SELECT c_id as id,name as Name,CONVERT(varchar(10),date,110) as date,query as Query,reply as Reply FROM complain", con);
        da.Fill(ds.complain);
        rprt.Load(Server.MapPath("~/crystalreport/CrystalReport2.rpt"));
        //rprt.Load.Server.MapPath("~/CrystalReport2.rpt");
        rprt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rprt;
    }
}