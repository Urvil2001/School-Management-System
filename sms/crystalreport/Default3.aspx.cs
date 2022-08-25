using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;


public partial class crystalreport_Default3 : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Database.mdf;Integrated Security=True;User Instance=True");
        DataSet3 ds = new DataSet3();
        SqlDataAdapter da = new SqlDataAdapter("select * from leaveapplication",con);
        da.Fill(ds.leaveapplication);
        rprt.Load(Server.MapPath("~/crystalreport/CrystalReport3.rpt"));
        //rprt.Load.Server.MapPath("~/CrystalReport2.rpt");
        rprt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rprt;
    }
}