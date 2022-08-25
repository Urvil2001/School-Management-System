using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnOn_Click(object sender, EventArgs e)
    {
        Label1.Text = "On";
        btnOn.CssClass = "btn btn-success";
        btnOff.CssClass = "btn btn-default";
    }
    protected void btnOff_Click(object sender, EventArgs e)
    {
        Label1.Text = "Off";
        btnOn.CssClass = "btn btn-default";
        btnOff.CssClass = "btn btn-danger";
    }
}