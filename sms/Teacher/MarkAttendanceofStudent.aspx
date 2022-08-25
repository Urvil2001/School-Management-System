<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="MarkAttendanceofStudent.aspx.cs" Inherits="Teacher_MarkAttendanceofStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Mark Student Status
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
               <form id="form1" runat="server">
                 <div class="form-group">
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass = "rounded-corners" HorizontalAlign="Center" AllowPaging="True" 
            PageSize="5" Width="803px" 
            >
            <Columns>
                    
                    <asp:ImageField DataImageUrlField="studentphoto" HeaderText="Image" 
                    SortExpression="studentphoto">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    
                  <asp:BoundField DataField="Enrollmentno" HeaderText="Enrollment no" 
                    SortExpression="Enrollmentno" >
                    <ControlStyle Width="80px" />
                    </asp:BoundField>
                <asp:BoundField DataField="fname" HeaderText="First Name" 
                    SortExpression="fname" />
                <asp:BoundField DataField="std" HeaderText="Standard" 
                    SortExpression="std" />
                <asp:TemplateField HeaderText="Mark Attendance">
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;
                        <div class="form-group">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" 
                                Width="200px">
                            <asp:ListItem Text="Select Item" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Present" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Absent" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Leave" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle 
                HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Save Attendance" 
                class="btn btn-lg btn-info btn-block" onclick="Button1_Click" />
        </div>
        <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                       <strong>
                           <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                       </div>

        
        </form></div></div></div></div></div>      


        


           

</asp:Content>

