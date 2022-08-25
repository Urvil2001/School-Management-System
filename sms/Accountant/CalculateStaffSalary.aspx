<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/MasterPage.master" AutoEventWireup="true" CodeFile="CalculateStaffSalary.aspx.cs" Inherits="Accountant_CalculateStaffSalary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%--<link rel="stylesheet" href="../Student/checkout-panel/style.css">--%>
<form id="for1" runat="server">



 <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Staff Salary</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">




 <div class="card-body">
     <asp:Panel ID="Panel1" runat="server">
     
    <div class="form-group">
        <table>
            <tr>
                <td>
            
                Teacher ID
                <asp:TextBox ID="tid" runat="server" CssClass="form-control" Width="400px"></asp:TextBox>
            
                </td>

                <td rowspan="3">
                    <asp:Image ID="Image1" runat="server" CssClass="form-control" style="margin-left:140px" Height="250px" Width="250px" />
                </td>

                <td rowspan="3">
                    <asp:Image ID="Image2" runat="server" height="130" Width="130" style="margin-left:60px;margin-bottom:50px" ImageUrl="~/Student/checkout-panel/img/paid.png" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="email" type="hidden" runat="server"></asp:TextBox>
                    <asp:TextBox ID="mob" type="hidden" runat="server"></asp:TextBox>
                Teacher Name
                <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>
            
                </td>
            </tr>
            <tr>
                <td>
            
                Salary
                <asp:TextBox ID="salary" runat="server" CssClass="form-control"></asp:TextBox>
              </td>
            </tr>
            </table>

            <div class="form-group">
                
                <asp:Label ID="Label2" runat="server" ForeColor="green" CssClass="form-control"></asp:Label>
            </div>

            <div class="form-group">
             
                <asp:Label ID="Label3" runat="server" ForeColor="red" CssClass="form-control"></asp:Label>
            </div>

             <div class="form-group">
             
                <asp:Label ID="Label1" runat="server" ForeColor="blue" CssClass="form-control"></asp:Label>
            </div>
            </div>
            
           
                <asp:Label ID="Label4" runat="server" Text="Label" CssClass="form-control"></asp:Label>
       
           <div class="alert alert-danger" id="error" runat="server" style="margin-top:10px; display:none">
                       <strong>
                           <asp:Label ID="Label5" runat="server"></asp:Label></strong> 
                       </div>
                                  
            <div class="form-group">
                Paying amount of salary
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    <div class="form-group">
    <asp:Button ID="Button1" runat="server" Text="Pay salary" onclick="Button1_Click" class="btn btn-lg btn-info btn-block" />
    </div>
     <center><asp:GridView ID="GridView1" runat="server" Width="809px">
         <HeaderStyle HorizontalAlign="Center" />
         <RowStyle HorizontalAlign="Center" />
     </asp:GridView> </center>
     </asp:Panel>
     <asp:Panel ID="Panel2" runat="server" Visible="False">

     <div>

    <div class="checkout-panel">
    <div class="panel-body">
      

      
      </div>
      
      <div class="payment-method" align="center">
        <label for="paypal" class="method paypal">
       
           
               
          <img src="../Student/checkout-panel/img/paytm.png" height="100px" width="200px" style="margin-right:270px"/>
          <div class="radio-input" style="margin-right:270px">
        <asp:RadioButton ID="online" runat="server" GroupName="payment" />
            <%--<input id="paypal" type="radio" name="payment">--%>
            Pay with Paytm</div>
           </label>
          <label for="offline" class="method paypal"   >
          
          <img src="../Student/checkout-panel/img/offline.png" height="100px" width="150px"/>
          <div class="radio-input">
            
                <asp:RadioButton ID="offline" runat="server" style="margin-bottom:20px" GroupName="payment" />
<%--            <input id="offline" type="radio" name="payment" style="margin-bottom:20px"  />
--%>            Pay offline
          </div>
          
          </label>
          </div>
          <br />
          <div class="form-group" >
                
                <asp:Button ID="Button2" runat="server" Text="Pay salary" 
                    CssClass="btn btn-lg btn-info btn-block" onclick="Button2_Click" />
          </div>
      </div>
    </div>
     </asp:Panel>

     </div>
     

    </div></div></div></div>

    </form>
</asp:Content>

