<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAssignment.aspx.cs" Inherits="Teacher_ViewAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



<form id="fo1" runat="server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                           <center> <strong class="card-title">Select Assignment</strong></center>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                   <div class="form-group">
                                   
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" AppendDataBoundItems="true"
    DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" CssClass="form-control">
    <asp:ListItem Value="0" Text="Select Assignment"></asp:ListItem>
</asp:DropDownList>
</div>
</div></div></div></div></div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [PDFfiles] WHERE (([std] = @std) AND ([subjectid] = @subjectid2))">
    <SelectParameters>
        <asp:SessionParameter Name="std" SessionField="std" Type="Int32" />
        <asp:SessionParameter Name="subjectid2" SessionField="subid" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</form>

<div class="container-fluid" style="background-color:White; padding:20px">


<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="Stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>


<asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
                <th>Student Name</th>
                <th>Roll no</th>
                <th>File Name</th>
                <th>View Assignment</th>
                
              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><%#Eval("name") %></td>
        <td><%#Eval("rollno") %></td>
        <td><%#Eval("filename") %></td>
        <td><%#checkpdf(Eval("filename"),Eval("id")) %></td>
        

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

