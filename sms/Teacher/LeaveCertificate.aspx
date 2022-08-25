<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaveCertificate.aspx.cs" Inherits="Teacher_LeaveCertificate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
           

.wrapper {
  background-color: #FFF;
  border-radius: 2px;
  box-shadow: 0px 2px 1px 0px #DDD;
  box-sizing: border-box;
  height: 300px;
  left: 50%;
  margin: -150px 0 0 -150px;
  position: absolute;
  top: 50%;
  width: 300px;
}

.input {
  background-color: transparent;
  border: none;
  border-bottom: 1px solid blue;
  color: #555;
  margin-top:-15px;
  font-family: 'Arvo';
  font-size: 18px;
  width:300px;
    
  padding: 10px 0px;
  position: relative;
 

  
}


.underline {
  background-color: dodgerblue;
  display: inline-block;
  height: 2px;
  left: 50px;
  margin-top: -4px;
  position: absolute;
  top: 185px;
  -webkit-transform: scale(0, 1);
  transform: scale(0, 1);
  -webkit-transition: all 0.5s linear;
  transition: all 0.5s linear;
  width: 202px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <asp:Panel ID="Panel1" runat="server" style="border:2px solid black;background-color:#D0F0C0" Width="600px">
                <table width="580px">
                    <tr align="center">
                    <td colspan="5">
                        <h5 style="margin-bottom:-27px">&nbsp;Shri V.R. Shah Smruti Adarsh Education Trust</h5><br />
                    </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                        <h2>ANUPAM VIDHYAVIHAR</h2>
                        
                            <h4>SECONDARY & HIGHER SECODARY SCHOOL(Govt. Recognised-1962)<br />
                            Shri V.R.Shah Smruti Vidya Bhavan,Kalupur,Ahmedabad-1.</h4>
                        
                          <h3 style="border-bottom:1px solid black;"><i>SCHOOL LEAVING CERTIFICATE</i></h3>
                          <h3 style="border-bottom:1px solid black"></h3>

                          
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                           <b>1. Name of Pupil in full </b>
                            <asp:Label ID="Label1" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center" Width="300px"></asp:Label>
<%--                            <asp:TextBox ID="TextBox1" runat="server" CssClass="input" style="text-align:center"></asp:TextBox>
--%>                        </td>

                    </tr>
                     <tr>
                        <td colspan="5">
                           <b>2. Date of Birth </b>
                            <asp:Label ID="Label2" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center" Width="300px"></asp:Label>
                            <%--<asp:TextBox ID="TextBox2" runat="server" CssClass="input" style="text-align:center"></asp:TextBox>--%>
                        </td>

                    </tr>
                     <tr>
                        <td colspan="5">
                           <b>3. Date of Birth,Month,Year </b>
                            <asp:Label ID="Label3" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center" Width="300px"></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center;margin-left:195px;margin-top:3px" Width="300px"></asp:Label>
                            <%--<asp:TextBox ID="TextBox3" runat="server" CssClass="input" style="text-align:center"></asp:TextBox>--%>
                           <%--<asp:TextBox ID="TextBox7" runat="server" CssClass="input" style="text-align:center;margin-left:195px;margin-top:3px"></asp:TextBox>--%>

                        </td>


                    </tr>
                     <tr>
                        <td colspan="5">
                           <b>4.Date of Leaving school </b>
                                <asp:Label ID="Label4" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center" Width="300px"></asp:Label>
                            <%--<asp:TextBox ID="TextBox4" runat="server" CssClass="input" style="text-align:center"></asp:TextBox>--%>
                        </td>

                    </tr>
                     <tr>
                        <td colspan="5">
                           <b>5.Reason for Leaving Certificate </b>
                            <asp:Label ID="Label5" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center" Width="300px"></asp:Label>
                            <%--<asp:TextBox ID="TextBox5" runat="server" CssClass="input" style="text-align:center"></asp:TextBox>--%>
                        </td>

                    </tr>
                     <tr>
                        <td colspan="5">
                           <b>6.Standard in which Studying </b>
                            <asp:Label ID="Label6" runat="server" Text="Label" style="border-bottom:1px solid blue;text-align:center" Width="300px"></asp:Label>
                            <%--<asp:TextBox ID="TextBox6" runat="server" CssClass="input" style="text-align:center"></asp:TextBox>--%>
                            <h3 style="border-bottom:1px solid black"></h3>
                            <h3 style="border-bottom:1px solid black"></h3>
                            <h5 style="margin-top:-20px">&nbsp;&nbsp;This is to certify that the above information is in accordance with the School Register</h5>
                        </td>

                    </tr>
                    <tr>
                        <td align="100px">
                            <h3 style="border-bottom:1px solid black;width:80px"></h3>
                            <h5 style="margin-top:-20px;margin-left:25px">Date</h5>
                        </td>
                        <td align="100px">
                             <h3 style="border-bottom:1px solid black;width:80px"></h3>
                            <h5 style="margin-top:-20px;margin-left:5px">Prepared By</h5>
                        </td>
                        <td align="100px">
                             <h3 style="border-bottom:1px solid black;width:80px"></h3>
                            <h5 style="margin-top:-20px;margin-left:5px">Checked by</h5>
                        </td>
                        <td align="100px">
                             <h3 style="border-bottom:1px solid black;width:80px"></h3>
                            <h5 style="margin-top:-20px;margin-left:2px">Class Teacher</h5>
                        </td>
                        <td align="100px">
                             <h3 style="border-bottom:1px solid black;width:80px"></h3>
                            <h5 style="margin-top:-20px;margin-left:15px">Principal</h5>
                        </td>
                    </tr>
                </table>
      
       </asp:Panel>
       <br />

        <asp:Button ID="Button1" runat="server" Text="PRINT L.C" 
            style="font-family:@Arial Unicode MS;font-size:larger;font-style:oblique;font-variant:small-caps;font-weight:bold" 
            Height="40px" Width="600px" onclick="Button1_Click"/>
       </center>
    </div>
    </form>
</body>
</html>
