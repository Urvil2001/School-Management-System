using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;

public partial class crystalreport_Default4 : System.Web.UI.Page
{
    ReportDocument rprt = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|Database.mdf;Integrated Security=True;User Instance=True");
        DataSet4 ds = new DataSet4();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Teacherattendance where rollid='3'", con);
        da.Fill(ds.Teacherattendance);
        rprt.Load(Server.MapPath("~/crystalreport/CrystalReport4.rpt"));
        //rprt.Load.Server.MapPath("~/CrystalReport2.rpt");
        rprt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rprt;
    }
}