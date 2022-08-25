<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Complaint.aspx.cs" Inherits="Student_Complaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Enter Your Complaint</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                      
                                      <div class="form-group" style="width:1000px" align="center" >
                                      <table align="center">
                                      <tr>
                                        <td align="center" style="width:350px">
                                         <strong> <label for="cc-payment" class="control-label mb-1">First Name</label></strong>
                                            <asp:TextBox ID="fname" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                        <td align="center" style="width:350px">
                                         <strong> <label for="cc-payment" class="control-label mb-1">Emaid Id</label></strong>
                                            <asp:TextBox ID="emailid" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                        <td align="center" style="width:350px">
                                         <strong> <label for="cc-payment" class="control-label mb-1">Date & Time</label></strong>
                                            <asp:TextBox ID="time" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                        <td align="center" style="width:350px">
                                         <strong> <label for="cc-payment" class="control-label mb-1">Enter Your Complaint Here</label><asp:RequiredFieldValidator
                                             ID="RequiredFieldValidator1" runat="server" ErrorMessage="complaint is empty" 
                                                ControlToValidate="TextBox1" Font-Bold="True" Font-Italic="True" 
                                                ForeColor="Red">*</asp:RequiredFieldValidator></strong>
                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" 
                                                style="text-align:center" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Submit Your Complaint" onclick="Button1_Click"
                                                 />
                                              </td>
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                                ShowMessageBox="True" ShowSummary="False" />

                                           <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                       <strong>
                           <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                       </div>
                                        </tr>
                                        </table>
                                </div>
                                </form>
                                </div></div></div></div></div>

</asp:Content>

