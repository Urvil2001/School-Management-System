<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="InquiryReply.aspx.cs" Inherits="Admin_InquiryReply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Visitor Inquiry Reply</strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                      
                                      <div class="form-group" align="center" >
                                      <table align="center">
                                      <tr>
                                        <td align="center" style="width:350px">
                                         <strong> <label for="cc-payment" class="control-label mb-1">Complaint ID</label></strong>
                                            <asp:TextBox ID="eid" runat="server" class="form-control" 
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
                                         <strong> <label for="cc-payment" class="control-label mb-1">Student Name</label></strong>
                                            <asp:TextBox ID="name" runat="server" class="form-control" 
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
                                         <strong> <label for="cc-payment" class="control-label mb-1">Email Id</label></strong>
                                            <asp:TextBox ID="email" runat="server" class="form-control" 
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
                                         <strong> <label for="cc-payment" class="control-label mb-1">Contact No</label></strong>
                                            <asp:TextBox ID="mob" runat="server" class="form-control" 
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
                                            <asp:TextBox ID="date" runat="server" class="form-control" 
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
                                         <strong> <label for="cc-payment" class="control-label mb-1">Enquiry Detail</label></strong>
                                            <asp:TextBox ID="query" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                         <tr>
                                        <td align="center" style="width:350px">
                                         <strong> <label for="cc-payment" class="control-label mb-1">Enquiry Reply</label></strong>
                                            <asp:TextBox ID="reply" runat="server" class="form-control" 
                                                style="text-align:center" TextMode="MultiLine" Height="111px"></asp:TextBox>
                                        </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                         <tr>
                                          <td>
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Send Reply"  Width="500px" style="background-color:Green" onclick="b1_Click" 
                                                  />
                                        </td>
                                        </tr>
                                        </div>
                                        </form>
                                        </div></div></div></div></div>

</asp:Content>

