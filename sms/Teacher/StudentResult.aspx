<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="StudentResult.aspx.cs" Inherits="Teacher_StudentResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<form id="f1" runat="server">
<div class="container-fluid" style="background-color:White; padding:20px">

    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Blue" 
        onclick="LinkButton1_Click">Declare Result</asp:LinkButton>
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="Stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
                <th>Image</th>
                <th>Roll no</th>
                <th>FirstName</th>
                <th>MiddleName</th>
                <th>LastName</th>
                <th>STD</th>
                <th>DIV</th>
                <th>View FullDetail</th>
              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("studentphoto")%>' Height="100px" Width="100px"/></td>
        <td><%#Eval("roll") %></td>
        <td><%#Eval("fname") %></td>
        <td><%#Eval("mname") %></td>
        <td><%#Eval("lname") %></td>
        <td><%#Eval("std") %></td>
        <td><%#Eval("div") %></td>
       <td align="center"><a href="CreateResult.aspx?id=<%#Eval("Enrollmentno") %>">View</a></td>
        

    </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>
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

