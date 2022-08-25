<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddDivision.aspx.cs" Inherits="Admin_AddDivision" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">  
<head id="h1" runat="server">
</head>
<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Add Division</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form action="" id="fo1" runat="server" method="post" novalidate="novalidate">
                                      
                                    <div class="form-group">
                                            Division
                                          <asp:TextBox ID="div" runat="server" class="form-control"></asp:TextBox>
                                      </div>
                                      <div class="form-group">
                                            No of Seats
                                          <asp:TextBox ID="no" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                      </div>
                                      <div class="form-group">
                                        Select Standard
                                          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                              DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id" AppendDataBoundItems="true">
                                              <asp:ListItem Value="0" Text="Select Standard"></asp:ListItem>
                                          </asp:DropDownList>
                                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                              ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                              SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                      </div>
                                      <div class="form-group">
                                          <asp:Button ID="Button1" runat="server" Text="Add Division" 
                                              CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click" />

                                        <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                           <strong>
                                               <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                           </div>
                                      </div>




                                  <asp:Panel ID="Panel1" runat="server">

                                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString %>" 
        SelectCommand="SELECT [divname], [noofseat], [std] FROM [Division] ORDER BY [std]"></asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>

                                    <center><asp:GridView ID="GridView1" runat="server" AllowPaging="True" Height="237px" 
            Width="815px" onpageindexchanging="GridView1_PageIndexChanging" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
            AutoGenerateColumns="False" onrowupdating="GridView1_RowUpdating" 
            onrowdatabound="GridView1_RowDataBound" 
            onrowdeleted="GridView1_RowDeleted" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
                        <asp:TemplateField HeaderText="DivId" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("divid") %>' Visible="false"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Divname">
               
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Div") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Seat">
            <EditItemTemplate>
                 <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("Seat") %>' onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Seat") %>'></asp:Label>
            </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Standard">
            
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Standard") %>'></asp:Label>
            </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField HeaderText="Edit" ShowEditButton="True" ItemStyle-ForeColor="Blue">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            
            </asp:CommandField>
                  
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" Font-Bold="False" 
                                    CommandName="Delete">Delete</asp:LinkButton>
                                <br />
                                <br />
                                <asp:Panel ID="Panel1" runat="server" BackColor="#F8F9FA" Font-Bold="True" style="margin-left:100px"
                                    ForeColor="Red" Height="92px" Width="342px" BorderColor="Black" BorderStyle="Solid">
                                    Do you Want to Delete Record?<br />
                                    <asp:Button ID="Button2" runat="server" Text="YES" Width="57px" />
                                    &nbsp;
                                    <asp:Button ID="Button3" runat="server" Text="NO" />
                                     
                                </asp:Panel>
                                <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="LinkButton2" DisplayModalPopupID="ModalPopupExtender1" />
                                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton2" PopupControlID="Panel1" OkControlID="Button2" CancelControlID="Button3">
                                </ajaxToolkit:ModalPopupExtender>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                 
      </Columns>
      
        <HeaderStyle BackColor="#F8F9FA" 
                HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView></center>

                                  </asp:Panel>
                                      </form>
                                      </div>
                                      </div>
                                      </div>
                                      </div></div>
                                      
</asp:Content>

