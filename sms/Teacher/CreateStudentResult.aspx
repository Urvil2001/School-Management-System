<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="CreateStudentResult.aspx.cs" Inherits="Teacher_CreateStudentResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
             <asp:Panel ID="pnlTextBoxes" runat="server">
    </asp:Panel>
    <hr />
    <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="AddTextBox" />
    <asp:Button ID="btnGet" runat="server" Text="Get Values" OnClick="GetTextBoxValues" />
    </div>
    </form>
</body>
</html>
