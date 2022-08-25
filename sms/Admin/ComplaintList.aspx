<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ComplaintList.aspx.cs" Inherits="Admin_ComplaintList" %>

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
                <th>Complaint Id</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Date</th>
                <th>Status</th>
                <th>View Complant Details</th>
              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        
        <td><%#Eval("c_id") %></td>
        <td><%#Eval("name") %></td>
        <td><%#Eval("email") %></td>
        <td><%#Eval("date") %></td>
        <td><%#Eval("status") %></td>
       
        
        
       <td align="center"><a href="Complaint_Reply.aspx?complaint_id=<%#Eval("c_id") %>">View</a></td>
        

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

