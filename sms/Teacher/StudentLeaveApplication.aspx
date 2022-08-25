<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="StudentLeaveApplication.aspx.cs" Inherits="Teacher_StudentLeaveApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Reply Student LeaveApplication</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">

<form id="for1" runat="server">
<center>
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        Width="878px">
        <Columns>
            <asp:TemplateField HeaderText="Approval">
                <ItemTemplate>
                    <div class="form-group">
                    <asp:CheckBox ID="CheckBox1" runat="server"/></div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="leaveapplicationid" HeaderText="Application ID" />
            <asp:BoundField DataField="rollno" HeaderText="Roll Number" />
            <asp:BoundField DataField="studentname" HeaderText="Name" />
             
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="leavedate" HeaderText="Start Date" />
            <asp:BoundField DataField="noofdays" HeaderText="No of Days" />
            
        </Columns>
        <HeaderStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Accept Leave Application" onclick="Button1_Click" CssClass="btn btn-lg btn-info btn-block" />
    
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT [leaveapplicationid], [description], CONVERT(varchar(10),[leavedate],110) as leavedate, [noofdays], [studentname], [rollno] FROM [Leave_application] WHERE (([div] = @div) AND ([standardid] = @standardid) AND (status='Pending'))">
        <SelectParameters>
            <asp:SessionParameter Name="div" SessionField="div" Type="String" />
            <asp:SessionParameter Name="standardid" SessionField="std" Type="Int32" />
        </SelectParameters>
       
    </asp:SqlDataSource>

    </form>
    </div>
    </div>
    </div>
    </div>
    </div>
    
</asp:Content>

