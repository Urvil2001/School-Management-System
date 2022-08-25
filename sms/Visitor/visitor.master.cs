using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Visitor_visitor : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('Data saved')</script>");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {

    }
}
