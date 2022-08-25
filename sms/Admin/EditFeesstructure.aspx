<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditFeesstructure.aspx.cs" Inherits="Admin_EditFeesstructure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Edit Fee Structure</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form action="" id="fo1" runat="server" method="post" novalidate="novalidate">
                                      
                                    <div class="form-group">
                                            Standard
                                          <asp:TextBox ID="std" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                      </div>

                                       <div class="form-group">
                                           Edit Admission Fee
                                          <asp:TextBox ID="afee" runat="server" class="form-control"></asp:TextBox>
                                      </div>

                                       <div class="form-group">
                                           Edit Tution Fee
                                          <asp:TextBox ID="tfee" runat="server" class="form-control"></asp:TextBox>
                                      </div>
                                     
                                      <div>
                                          
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Update Fee Structure" onclick="b1_Click"   />
                                               <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                                <strong>
                                                 <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                                 </div>
                                      </div>

                                      
                                  </form>
                              </div>
                          </div>

                        </div>
                    </div> <!-- .card -->

                  </div><!--/.col-->

</asp:Content>

