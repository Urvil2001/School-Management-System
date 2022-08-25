<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeesPayment.aspx.cs" Inherits="Student_FeesPayment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Document</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
  
  <link rel="stylesheet" href="checkout-panel/style.css">
<meta name="robots" content="noindex,follow" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="checkout-panel">
    <div class="panel-body">
      <h2 class="title">Fees Payment</h2>

      <div class="progress-bar">
        <div class="step active"></div>
        <div class="step active"></div>
        <div class="step"></div>
        <div class="step"></div>
      </div>
      <table align="center">
      <tr align="center">
      <td>
      <div class="payment-method" align="center">
        <label for="paypal" class="method paypal">
          <img src="checkout-panel/img/paytm.png" height="50px" width="130px"/>
          <div class="radio-input">
            <input id="paypal" type="radio" name="payment">
            Pay with Paytm
          </div>
        </label>
      </div>
      </td>
      </tr>
      </table>
     
      <div class="input-container">
    <i class="fa fa-user icon" style="font-size:25px"></i>
        <asp:TextBox ID="fname" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp;
        <i class="fa fa-user icon" style="font-size:25px"></i>
        <asp:TextBox ID="mname" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp;
         <i class="fa fa-user icon" style="font-size:25px"></i>
        <asp:TextBox ID="lname" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>
  </div>

  <div class="input-container">
    <i class="fa fa-graduation-cap icon" style="font-size:25px"></i>
      <asp:TextBox ID="std" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>
      &nbsp;&nbsp;
      <i class="fa fa-rupee icon" style="font-size:25px" ></i>
      <asp:TextBox ID="rupee" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>

  </div>
  
  <div class="input-container">
    <i class="fa fa-envelope icon" style="font-size:25px"></i>
      <asp:TextBox ID="email" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>
      &nbsp;&nbsp;
      <i class="fa fa-phone icon" style="font-size:30px"></i>
      <asp:TextBox ID="mob" runat="server" CssClass="small-hey" ReadOnly="True"></asp:TextBox>

  </div>
  
  
    <div class="panel-footer">
   <table align="center">
      <tr align="center">
      <td>
        <asp:Button ID="Button1" runat="server" Text="Pay Fees" CssClass="btn next-btn" 
              onclick="Button1_Click"/>
       </td>
     </tr>
     <tr>
     <td>
        
                  Pending Amount:
        
                  <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
     </td></tr>
     </table>
    </div>
    
  </div>
  </div>
   
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="checkout-panel/script.js"></script>
  </div>
    </form>
</body>
</html>
