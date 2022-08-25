<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="FeesStructure.aspx.cs" Inherits="Admin_FeesStructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="container-fluid" style="background-color:White; padding:20px">

<asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
               <center><th>Standard ID</th></center>
                <center><th>Admission fee</th></center>
                <center><th>Tution Fee</th></center
                <center><th>Edit Details</th></center>

              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
       
        <center><td><%#Eval("standard") %></td></center>
        <center><td><%#Eval("admissionfee") %></td></center>
        <center><td><%#Eval("tutionfee") %></td></center>
        <td><a href="EditFeesstructure.aspx?id=<%#Eval("standard") %>">Edit Details</a></td>
                                   
       
        
        
     
        

    </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>
</div>
</asp:Content>

