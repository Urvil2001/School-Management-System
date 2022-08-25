using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Admin_AddDivision : System.Web.UI.Page
{
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
            refresh();
        }
        else
        {
            refresh();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        
        cmd.CommandText = "insert into Division values ('" + div.Text + "'," + no.Text + "," + DropDownList1.SelectedItem.Text + ")";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        
        error.Style.Add("display", "block");
        Label1.Text = "Division Added";
       
    }

    public void refresh()
    {
        SqlCommand cmd = new SqlCommand();
        
        cmd.CommandText = "select divid ,divname as Div,noofseat as Seat,std as Standard from Division ORDER BY std";
        cmd.Connection = con;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
      
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label sta = GridView1.Rows[e.RowIndex].FindControl("Label3") as Label;
        
        SqlCommand cmd = new SqlCommand("delete FROM Division where divid='" + sta.Text + "'", con);
        cmd.ExecuteNonQuery();
        
        refresh();  
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        refresh();  
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label sta = GridView1.Rows[e.RowIndex].FindControl("Label3") as Label;
       // TextBox div = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
        TextBox seat = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
        //TextBox std = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
        if (seat.Text == "")
        {
            Response.Write("<script>alert('Please enter admission fee');</script>");
        }

        else
        {
            SqlCommand cmd = new SqlCommand("update Division set noofseat=" + seat.Text + " where divid=" + sta.Text + "");
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            
            GridView1.EditIndex = -1;
            Response.Write("<script>alert('Updated Successfully');</script>");
            refresh();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        refresh();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        refresh(); 
    }
}