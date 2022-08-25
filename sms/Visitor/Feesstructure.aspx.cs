using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Visitor_Feesstructure : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            GridView1.Rows[i].Cells[3].Text=Convert.ToString(Convert.ToInt32(GridView1.Rows[i].Cells[2].Text)*12);
            GridView1.Rows[i].Cells[4].Text = Convert.ToString(Convert.ToInt32(GridView1.Rows[i].Cells[3].Text) +Convert.ToInt16(GridView1.Rows[i].Cells[1].Text));
                

        }
    }
}