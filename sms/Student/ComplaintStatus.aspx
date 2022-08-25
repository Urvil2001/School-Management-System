<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="ComplaintStatus.aspx.cs" Inherits="Student_ComplaintStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Complaint Status</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form action="" id="fo1" runat="server" method="post" novalidate="novalidate">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [c_id], [date], [query], [status], [who], [reply] FROM [complaint] WHERE ([email] = @email)">
        <SelectParameters>
            <asp:SessionParameter Name="email" SessionField="email" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
 
 <div class="card-body">
 <center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
         DataKeyNames="c_id" DataSourceID="SqlDataSource1" Height="232px" Width="801px" >
        <Columns>
            <asp:BoundField DataField="c_id" HeaderText="ID" InsertVisible="False" ItemStyle-Width="50px"
                ReadOnly="True" SortExpression="c_id">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="query" HeaderText="Complaint Details" 
                SortExpression="query">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="who" HeaderText="Replyer" SortExpression="status">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="reply" HeaderText="Reply msg" SortExpression="reply">
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
    </asp:GridView></center>
    </div> 
    </form>
    </div>
    </div>
    </div>
    </div>
    
    </div>
    
</asp:Content>

