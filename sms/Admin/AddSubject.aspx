<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddSubject.aspx.cs" Inherits="Admin_AddSubject" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head runat="server">
</head>
<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Add Subject</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form action="" id="fo1" runat="server" method="post" novalidate="novalidate">
                                      
                                    <div class="form-group">
                                            Standard
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                                DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0" Text="Select Standard"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                      </div>


                                      <div class="form-group">
                                            Select or Add Subject
                                          <br />
                                        <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" DataSourceID="SqlDataSource2" 
                                                DataTextField="subjectname" DataValueField="subjectname" MaxLength="0" 
                                                style="display: inline;" AutoCompleteMode="SuggestAppend">
                                          </ajaxToolkit:ComboBox>
                                          <asp:ScriptManager ID="ScriptManager1" runat="server">
                                          </asp:ScriptManager>
                                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                SelectCommand="SELECT DISTINCT [subjectname] FROM [Subject]"></asp:SqlDataSource>
                                      </div>

                                      <div class="form-group">
                                          <asp:Button ID="Button1" runat="server" Text="Save Subject" 
                                              CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click" />
                                              <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                           <strong>
                                               <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                           </div>
                                           <br />
                                           <br />

                                           <div class="form-group">
                                                      <center> <asp:GridView ID="GridView2" runat="server" 
                                                        AllowPaging="True" Height="237px" 
                                                        Width="800px" 
                                                        onpageindexchanged="GridView2_PageIndexChanged" 
                                                        onpageindexchanging="GridView2_PageIndexChanging1" >
                                                    <HeaderStyle 
                                                            HorizontalAlign="Center" />
                                                    <RowStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                        SelectCommand="SELECT [subjectname], [stdid] FROM [Subject]"></asp:SqlDataSource>
                                           </div>
                                           </center>
                                      </div>
                                      </form>
                                      </div>
                                      </div>
                                      </div>
                                      </div>
                                      </div>
                                      
</asp:Content>

