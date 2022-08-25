<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Announcement.aspx.cs" Inherits="Admin_Announcement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Send Announcement</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form action="" id="fo1" runat="server" method="post" novalidate="novalidate">
                                        <div class="form-group">
                                        Select Standard
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                                DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                        </div>
                                        <div class="form-group">    
                                           <label>Write Announcement</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                               runat="server" ControlToValidate="TextBox1" Font-Bold="True" Font-Italic="True" ErrorMessage="Some Announcement is mandatory" ForeColor="red" Text="*"></asp:RequiredFieldValidator>
                                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </div>
                                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                        <div class="form-group">
                                            <asp:Button ID="Button1" runat="server" Text="Send Announcement" 
                                                CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click" />
                                        </div>
                                  </form>      
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 </div>
                                 
                                


</asp:Content>

