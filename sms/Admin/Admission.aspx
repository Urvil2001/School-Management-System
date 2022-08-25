<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admission.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="container-fluid" style="background-color:White; padding:20px">

<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="Stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
                <th>Image</th>
                <th>FirstName</th>
                <th>FatherName</th>
                <th>LastName</th>
                <th>DOB</th>
                <th>STD</th>
                <th>Email</th>
                <th>Contact</th>
                <th>Verified</th>
                <th>View FullDetail</th>
              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("studentphoto")%>' Height="100px" Width="100px"/></td>
        <td><%#Eval("fname") %></td>
        <td><%#Eval("mname") %></td>
        <td><%#Eval("lname") %></td>
        <td><%#Eval("dob") %></td>
        <td><%#Eval("std") %></td>
        <td><%#Eval("email") %></td>
        <td><%#Eval("phno") %></td>
        <td><%#Eval("status") %></td>
        
        
       <td align="center"><a href="Admission_detail.aspx?username=<%#Eval("email") %>">View</a></td>
        

    </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>
</div>


<script type="text/javascript">


    $(document).ready(function () {
        $('#example').DataTable({
            "pagingType": "full_numbers"
        });
    });
                </script>

</asp:Content>

