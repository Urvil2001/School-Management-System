<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveStatus.aspx.cs" Inherits="Teacher_LeaveStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
                                      SelectCommand="SELECT [leaveapplicationid] as [ID], [description] as [Description], CONVERT(varchar(10),[leavedate],101) as [LeaveDate], [noofdays] as [No of Days], [status] as [Status] FROM [Leave_application] WHERE ([rollno] = @id)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="id" SessionField="id" Type="String" />
                                          

                                      </SelectParameters>

                                  </asp:SqlDataSource>
        </form>
        </div>
        </div>
        </div>
        </div>
        </div>
        

</asp:Content>

