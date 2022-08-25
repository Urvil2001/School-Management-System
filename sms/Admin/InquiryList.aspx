<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="InquiryList.aspx.cs" Inherits="Admin_InquiryList" %>

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
                <th>Inquiry Id</th>
                <th>Visitor Name</th>
                <th>Email</th>
                <th>Contact No</th>
                <th>Date</th>
                <th>Status</th>
                <th>View & Reply Details</th>
              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        
        <td><%#Eval("e_id") %></td>
        <td><%#Eval("studentname") %></td>
        <td><%#Eval("email") %></td>
        <td><%#Eval("mobno") %></td>
        <td><%#Eval("date") %></td>
        <td><%#Eval("status") %></td>

       
        
        
       <td align="center"><a href="InquiryReply.aspx?Inquiry_id=<%#Eval("e_id") %>">View & Reply</a></td>
        

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

