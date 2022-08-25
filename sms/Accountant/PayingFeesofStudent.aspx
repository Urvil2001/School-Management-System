<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/MasterPage.master" AutoEventWireup="true" CodeFile="PayingFeesofStudent.aspx.cs" Inherits="Accountant_PayingFeesofStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Paying Fees of student</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                          <form id="fo1" runat="server">
                              <div class="card-body">
                                  
                                    <div class="form-group">
                                    Enter Enrollment Number
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enrollment Number"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Button ID="Button1" runat="server" Text="Search" 
                                            CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click" />
                                    </div>

                                     <div class="alert alert-danger" id="error" runat="server" style="margin-top:10px; display:none">
                                               <strong>
                                                   <asp:Label ID="Label2" runat="server"></asp:Label></strong> 
                                               </div>
                                    </div>
                                  <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            <div class="card-header">
                            <strong class="card-title">Student Detail</strong>
                                            </div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                Student name
                                                    <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>
                                                <div class="form-group">
                                                    Father name
                                                    <asp:TextBox ID="mname" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>

                                                <div class="form-group">
                                                    Surname<asp:TextBox ID="lname" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>

                                                <div class="form-group">
                                                    Email ID<asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>

                                                <div class="form-group">
                                                    Contact Number<asp:TextBox ID="mob" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>


                                                <div class="form-group">
                                                    Standard
                                                    <asp:TextBox ID="std" runat="server" CssClass="form-control"></asp:TextBox>

                                                </div>

                                                <div class="form-group">
                                                    <b>Enter Amount</b>
                                                    <asp:TextBox ID="amount" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    Pending Amount:₹
                                                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Button ID="Button2" runat="server" Text="PayFees" 
                                                        CssClass="btn btn-lg btn-info btn-block" onclick="Button2_Click" />
                                                </div>








                                            </div>

                                                
                                  </asp:Panel>
                                    </form>
                                    
                                </div>
                            </div>
                            </div>
                            </div>
                            

</asp:Content>

