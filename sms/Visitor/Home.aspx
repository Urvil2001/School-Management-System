<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor/visitor.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Visitor_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        
    <table align="center">
        <tr>
            <td>
                <div style="background-image: url(../Visitor/images/slide1.gif);height:500px;width:1348px; background-position:center"  >
                    <asp:Label ID="Label1" runat="server" style="text-align:center" 
                        ondatabinding="Label1_DataBinding"></asp:Label>
                &nbsp;</div>
            </td>
            
        </tr>
    </table>

        
</asp:Content>

