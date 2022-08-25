<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master"  AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Student_Default2" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form id="for1" runat="server">
    <div class="btn-group" role="group" aria-label="...">
    <asp:ScriptManager runat="server" ID="sm">
 </asp:ScriptManager>
 <asp:updatepanel ID="Updatepanel1" runat="server">
 <ContentTemplate>
 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="btnOn" runat="server" class="btn btn-success" Text="On" 
            onclick="btnOn_Click"  /> 
        <asp:Button ID="btnOff" runat="server" class="btn btn-default" Text="Off" 
            onclick="btnOff_Click"/>
         </ContentTemplate>
 </asp:updatepanel>
    </div>
    
    </form>
</asp:Content>

