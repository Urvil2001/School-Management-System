<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="SalaryStatus.aspx.cs" Inherits="Teacher_SalaryStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Salary Status
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
               <form id="form1" runat="server">
                 <div class="form-group">
                 <center>
                     <asp:GridView ID="GridView1" runat="server" Width="801px">
                         <HeaderStyle HorizontalAlign="Center" />
                         <RowStyle HorizontalAlign="Center" />
                     </asp:GridView></center>

                     </div></form></div></div></div></div></div>
</asp:Content>

