<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                        
                            <h3><center><strong class="card-title">Change Password</strong></center></h3>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                
                                  <form id="fo1" runat="server">
                                   <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Enter Your Old Password</label>&nbsp;<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator1" runat="server" 
                                              ErrorMessage="Enter Old Password" ControlToValidate="opass" Font-Bold="True" 
                                              Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="opass" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Enter Your New Password</label>&nbsp;<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator2" runat="server" 
                                              ErrorMessage="Enter New Password" ControlToValidate="npass" Font-Bold="True" 
                                              Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="npass" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Confirm Password</label>&nbsp;<asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator3" runat="server" 
                                              ErrorMessage="Enter Confirm Password" ControlToValidate="cpass" Font-Bold="True" 
                                              Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                              ErrorMessage="Password is not match " ControlToValidate="cpass" 
                                              ControlToCompare="npass" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:CompareValidator>
                                          <asp:TextBox ID="cpass" runat="server" class="form-control"  
                                              TextMode="Password"></asp:TextBox>
                                      </div>

                                       <div>
                                           <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block"
                                              Text="Change Password" onclick="b1_Click" />
                                      </div>
                                       <div class="alert alert-success" id="Div2" runat="server" style="margin-top:10px; display:none">
                                               <strong>
                                                   <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                               </div>
                                       <div class="alert alert-danger" id="Div1" runat="server" style="margin-top:10px; display:none">
                                               <strong>
                                                   <asp:Label ID="Label2" runat="server"></asp:Label></strong> 
                                               </div>
                                      </form>
                                      </div>
                                      </div></div></div></div>

 <script type = "text/javascript">
     function Confirm() {
         var confirm_value = document.createElement("INPUT");
         confirm_value.type = "hidden";
         confirm_value.name = "confirm_value";
         if (confirm("Do you want to save data?")) {
             confirm_value.value = "Yes";
         } else {
             confirm_value.value = "No";
         }
         document.forms[0].appendChild(confirm_value);
     }
    </script>
</asp:Content>

