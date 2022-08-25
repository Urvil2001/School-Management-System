<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditStudentDetails.aspx.cs" Inherits="Admin_EditStudentDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                        <form id="fo1" runat="server">
                            <strong class="card-title">
                                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Admin/ViewStudentDetails.aspx" ForeColor="blue">Back</asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Edit Student Details</strong>
                               
                        </div>
                        
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                          
                                      <div class="form-group">
                                      
                                            <table>
                                            <tr>
                                            <td>
                                            
                                          <label  class="control-label mb-1">First Name</label>
                                          <asp:TextBox ID="fname" runat="server" class="form-control" Width="400px"></asp:TextBox>
                                          </td>
                                          <td rowspan="3">
                                              <asp:Image ID="Image1" runat="server" width="200px" Height="150px" style="margin-left:120px"/><br />
                                              <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Width="350px" style="margin-left:40px" />
                                              <asp:TextBox ID="TextBox1" runat="server" type="hidden"></asp:TextBox>
                                          </td>
                                            </tr>
                                            <tr>
                                            <td>
                                          <label  class="control-label mb-1">Father Name</label>
                                         <asp:TextBox ID="mname" runat="server" class="form-control" Width="400px"></asp:TextBox>
                                         </td>
                                         </tr>
                                         <tr>
                                         <td>
                                             <label  class="control-label mb-1">Last Name</label><br />
                                           <asp:TextBox ID="lname" runat="server" class="form-control" Width="400px"></asp:TextBox>

                                         </td>
                                         </tr>
                                      </table>
                                           
                                      </div>

                                      <div class="form-group">
                                          <label class="control-label mb-1">DOB</label><br />
                                          <asp:TextBox ID="dob" runat="server" class="form-control"></asp:TextBox>

                                      </div>

                                       <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Gender</label>
                                           <asp:DropDownList ID="gender" runat="server" CssClass="form-control">
                                               <asp:ListItem>Male</asp:ListItem>
                                               <asp:ListItem>Female</asp:ListItem>
                                           </asp:DropDownList>
                                      </div>

                                       <div class="form-group">
                                           <label for="cc-payment" class="control-label mb-1">Standard</label>
                                           <asp:DropDownList ID="std" runat="server" CssClass="form-control" 
                                               DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id">
                                               
                                           </asp:DropDownList>
                                           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                               ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                               SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                      </div>

                                      <div class="form-group">
                                          <label  class="control-label mb-1">Division</label><br />
                                            <asp:TextBox ID="div1" runat="server" class="form-control"></asp:TextBox>

                                      </div>
                                       <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Address</label>
                                          <asp:TextBox ID="address" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                      </div>

                                      <div class="form-group">
                                          <label  class="control-label mb-1">Contact No</label><br />
                                            <asp:TextBox ID="mob" runat="server" class="form-control"></asp:TextBox>

                                      </div>
                                     
                                     <div class="form-group">
                                          <label  class="control-label mb-1">Email Id</label><br />
                                            <asp:TextBox ID="email" runat="server" class="form-control"></asp:TextBox>

                                      </div>

                                      

                                      <div>
                                          
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Update Details" onclick="b1_Click"  />
                                           
                                        <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                        <strong>
                                               <asp:Label ID="Label1" runat="server"></asp:Label></strong> 

                                              
                                           </div>
                                           
                                      </div>
                                      </form>
                                    </div>
                                    </div></div></div>                 
                                     
                                       
                                       
                                    
                                 
                     
</asp:Content>

