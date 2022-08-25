<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherAttendance.aspx.cs" Inherits="Admin_TeacherAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<form id="fo1" runat="server">



<div class="container-fluid" style="background-color:White; padding:20px">

<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="Stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass = "rounded-corners" HorizontalAlign="Center" AllowPaging="True" 
            PageSize="5" Width="803px" ondatabound="GridView1_DataBound" 
            >
            <Columns>
                    <asp:ImageField DataImageUrlField="pic" HeaderText="Image" 
                    SortExpression="pic">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    
                  <asp:BoundField DataField="id" HeaderText="ID" 
                    SortExpression="fname" >
                    <ControlStyle Width="80px" />
                    </asp:BoundField>
                <asp:BoundField DataField="fname" HeaderText="First Name" 
                    SortExpression="fname" />
                <asp:BoundField DataField="standard" HeaderText="Standard" 
                    SortExpression="std" />
                <asp:TemplateField HeaderText="Mark Attendance">
                    <ItemTemplate>
                        &nbsp;&nbsp;&nbsp;
                        <div class="form-group">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Width="200px">
                            <asp:ListItem Value="0">Select Status</asp:ListItem>
                            <asp:ListItem Value="1">Present</asp:ListItem>
                            <asp:ListItem Value="2">Absent</asp:ListItem>
                            <asp:ListItem Value="3">Leave</asp:ListItem>
                           
                        </asp:DropDownList>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle 
                HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>


<br />
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Save Attendance" 
                CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click"/>

             <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                       <strong>
                           <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                       </div>
        </div>
</div>
</form>

<script type="text/javascript">


    $(document).ready(function () {
        $('#example').DataTable({
            "pagingType": "full_numbers"
        });
    });
                </script>







        



</asp:Content>

