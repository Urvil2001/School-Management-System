<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="TeacherDetails.aspx.cs" Inherits="Admin_TeacherDetails"  EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<head runat="server">
</head>
<div class="container-fluid" style="background-color:White; padding:20px">
 <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  

<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="Stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
                <th>Image</th>
                <th>ID</th>
                <th>First Name</th>
                <th>Father Name</th>
                <th>Last Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Mob no</th>
                <th>STD</th>
                <th>Subject Name</th>
                <th>Email</th>
                <th>DOJ</th>
                <th>Salary</th>
                <th>Edit Details</th>    
                <th>Delete Record</th>
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("pic")%>' Height="100px" Width="100px"/></td>
        <td><%#Eval("id") %></td>
        <td><%#Eval("fname") %></td>
        <td><%#Eval("mname") %></td>
        <td><%#Eval("lname") %></td>
        <td><%#Eval("dob") %></td>
        <td><%#Eval("gender") %></td>
        <td><%#Eval("address") %></td>
        <td><%#Eval("ph_no") %></td>
        <td><%#Eval("standard") %></td>
        <td><%#Eval("subjectname") %></td>
        <td><%#Eval("emailid") %></td>
        <td><%#Eval("doj") %></td>
        <td><%#Eval("salary") %></td>
        <td><a href="EditTeacherDetails.aspx?id=<%#Eval("id") %>">Edit Details</a></td>
        <td><a href="DeleteTeacher.aspx?id=<%#Eval("id") %>">Delete Record</a></td>    
    </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>


<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable({
            "pagingType": "full_numbers"
        });
    });
                </script>



</asp:Content>

