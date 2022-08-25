<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="AttendanceStatus.aspx.cs" Inherits="Teacher_AttendanceStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Attendance Status
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
    <form id="form1" runat="server">
    <div class="form-group">
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
            AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="1">Jan</asp:ListItem>
        <asp:ListItem Value="2">Feb</asp:ListItem>
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
    <br />
    <br />
    
    <center><asp:GridView ID="GridView1" runat="server" 
        Width="802px" EmptyDataText="No Record Found..">
        <HeaderStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView></center>
    </form>
    </div></div></div></div></div>

</asp:Content>

