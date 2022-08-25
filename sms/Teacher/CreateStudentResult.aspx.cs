using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Teacher_CreateStudentResult : System.Web.UI.Page
{
    int count;
    SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    protected void Page_PreInit(object sender, EventArgs e)
    {
        List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtDynamic")).ToList();
        int i = 1;
        foreach (string key in keys)
        {
            this.CreateTextBox("txtDynamic" + i);
            i++;
        }
        
    }

    protected void AddTextBox(object sender, EventArgs e)
    {
        int index = pnlTextBoxes.Controls.OfType<TextBox>().ToList().Count + 1;
        this.CreateTextBox("txtDynamic" + index);
    }
    private void CreateTextBox(string id)
    {
                SqlCommand cmd = new SqlCommand();
                con.Open();
                cmd.CommandText = "select count(subjectid) from Subject where stdid='5'";
                cmd.Connection = con;
                count = Convert.ToInt16(cmd.ExecuteScalar());
               
                con.Close();
                
                    TextBox txt = new TextBox();
                    txt.ID = id;
                    count = count + 1;
                    pnlTextBoxes.Controls.Add(txt);
                
                

               
              

            
    }
    protected void GetTextBoxValues(object sender, EventArgs e)
    {
        int value = 0;
        string message = "";
        string id = "";
        int sum = 0;
        foreach (TextBox textBox in pnlTextBoxes.Controls.OfType<TextBox>())
        {
            message += textBox.ID + ": " + textBox.Text + "\\n";


            id = textBox.ID;
            if (textBox.ID == "txtDynamic1")
            {
                value = Convert.ToInt16(textBox.Text);
            }
            else
            {
                value = value + Convert.ToInt16(textBox.Text);
            }



        }
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        Response.Write(value);
    }
}