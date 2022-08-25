<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="LeaveStatus.aspx.cs" Inherits="Student_LeaveStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Leave Application Status</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                        

    <center><asp:GridView ID="GridView1" runat="server" Width="799px" DataSourceID="SqlDataSource1">
        <HeaderStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView></center>
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                      SelectCommand="SELECT [leaveapplicationid] as [ID], [description] as [Description], CONVERT(varchar(10),[leavedate],101) as [LeaveDate], [noofdays] as [No of Days], [status] as [Status] FROM [Leave_application] WHERE ([rollno] = @roll) and ([div] = @div) and([standardid] = @std)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="roll" SessionField="roll" Type="String" />
                                          <asp:SessionParameter Name="div" SessionField="div" Type="String" />
                                          <asp:SessionParameter Name="std" SessionField="std" Type="String" />

                                      </SelectParameters>

                                  </asp:SqlDataSource>
        </form>
        </div>
        </div>
        </div>
        </div>
        </div>
        
</asp:Content>

