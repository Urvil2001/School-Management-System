<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="ViewAnnouncement.aspx.cs" Inherits="Student_ViewAnnouncement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">View Announcement</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form action="" id="fo1" runat="server" method="post" novalidate="novalidate">
                                      
                                      <div class="form-group">
                                      <asp:GridView ID="GridView1" runat="server" 
        DataSourceID="SqlDataSource1" Height="179px" Width="803px" 
           AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="announcementid" HorizontalAlign="Center">
                                          <Columns>
                                              <asp:BoundField DataField="announcementid" HeaderText="announcementid" 
                                                  InsertVisible="False" ReadOnly="True" SortExpression="announcementid" />
                                              <asp:BoundField DataField="description" HeaderText="description" 
                                                  SortExpression="description" />
                                          </Columns>
        <HeaderStyle
                HorizontalAlign="Center" Font-Underline="true" Width="70px" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [announcementid] as [AnnouncementID], [description] as [Description] FROM [Announcement] WHERE ([std] = @std)">
        <SelectParameters>
            <asp:SessionParameter Name="std" SessionField="std" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </form>
    </div>
    </div>
    </div>
    </div>
    </div>
    

</asp:Content>

