using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;

public partial class crystalreport_Default5 : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True");
        DataSet5 ds = new DataSet5();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM studentattendance where rollid='2'", con);
        da.Fill(ds.studentattendance);
        rprt.Load(Server.MapPath("~/crystalreport/CrystalReport5.rpt"));
        //rprt.Load.Server.MapPath("~/CrystalReport2.rpt");
        rprt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rprt;
    }
}