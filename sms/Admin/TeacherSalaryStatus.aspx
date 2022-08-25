<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherSalaryStatus.aspx.cs" Inherits="Admin_TeacherSalaryStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Teacher Salary Status
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
               <form id="form1" runat="server">
                 <div class="form-group">
                    Select Month
                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                         AutoPostBack="True">
                         <asp:ListItem Value="0">Jan</asp:ListItem>
                         <asp:ListItem Value="1">Feb</asp:ListItem>
                         <asp:ListItem Value="3">March</asp:ListItem>
                         <asp:ListItem Value="4">April</asp:ListItem>
                         <asp:ListItem Value="5">May</asp:ListItem>
                         <asp:ListItem Value="6">June</asp:ListItem>
                         <asp:ListItem Value="7">July</asp:ListItem>
                         <asp:ListItem Value="8">Aug</asp:ListItem>
                         <asp:ListItem Value="9">Sep</asp:ListItem>
                         <asp:ListItem Value="10">Oct</asp:ListItem>
                         <asp:ListItem Value="11">Nov</asp:ListItem>
                         <asp:ListItem Value="12">Dec</asp:ListItem>
                     </asp:DropDownList>
                 </div>

                 <div class="form-group">
                    <center>
                     <asp:GridView ID="GridView1" runat="server" Width="1000px">
                         <HeaderStyle HorizontalAlign="Center" />
                         <RowStyle HorizontalAlign="Center" />
                     </asp:GridView>
                    </center>
                 </div>
                 </form>
                 </div>
                 </div>
                 </div>
                 </div>
                 </div>
                 

</asp:Content>

