<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/MasterPage.master" AutoEventWireup="true" CodeFile="CalculateSalaryOfStaff.aspx.cs" Inherits="Accountant_CalculateSalaryOfStaff" %>

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
                <th>Teacher ID</th>
                <th>First Name</th>
                <th>Salary</th>
                <th>Standard</th>
                <th>Counting Salary</th>
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("pic")%>' Height="100px" Width="100px"/></td>
        <td><%#Eval("id") %></td>
        <td><%#Eval("fname") %></td>
        <td><%#Eval("salary") %></td>
        <td><%#Eval("standard") %></td>
       <td align="center"><a href="CalculateStaffSalary.aspx?id=<%#Eval("id") %>">Count salary</a></td>
        

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

