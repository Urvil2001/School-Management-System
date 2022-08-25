<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="EditTeacherDetails.aspx.cs" Inherits="Admin_EditTeacherDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head runat="server"></head>
    <form id="form1" runat="server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Update Details</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                                   <table>
                                            <tr>
                                            <td>
                                            
                                          <label  class="control-label mb-1">First Name</label>
                                          <asp:TextBox ID="fname1" runat="server" class="form-control" Width="400px"></asp:TextBox>
                                          </td>
                                          <td rowspan="3">
                                              <asp:Image ID="Image2" runat="server" width="200px" Height="150px" style="margin-left:120px"/><br />
                                              <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" Width="350px" style="margin-left:40px" />
                                              <asp:TextBox ID="TextBox3" runat="server" type="hidden"></asp:TextBox>
                                          </td>
                                            </tr>
                                            <tr>
                                            <td>
                                          <label  class="control-label mb-1">Father Name</label>
                                         <asp:TextBox ID="mname1" runat="server" class="form-control" Width="400px"></asp:TextBox>
                                         </td>
                                         </tr>
                                         <tr>
                                         <td>
                                             <label  class="control-label mb-1">Last Name</label><br />
                                           <asp:TextBox ID="lname1" runat="server" class="form-control" Width="400px"></asp:TextBox>

                                         </td>
                                         </tr>
                                      </table>
                                           
                                      </div>

                                      <div class="form-group">
                                          <label class="control-label mb-1">DOB</label><br />
                                          <asp:TextBox ID="DOB1" runat="server" class="form-control" DataFormatString="{0:dd/MM/yyyy}"></asp:TextBox>

                                          <ajaxToolkit:CalendarExtender ID="DOB1_CalendarExtender" runat="server" 
                                              BehaviorID="DOB1_CalendarExtender" TargetControlID="DOB1">
                                          </ajaxToolkit:CalendarExtender>
                                          <asp:ScriptManager ID="ScriptManager1" runat="server">
                                          </asp:ScriptManager>
                                      </div>

                                       <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Gender</label>
                                           <asp:DropDownList ID="gender1" runat="server" CssClass="form-control">
                                               <asp:ListItem>Male</asp:ListItem>
                                               <asp:ListItem>Female</asp:ListItem>
                                           </asp:DropDownList>
                                      </div>

                                       <div class="form-group">
                                           <label for="cc-payment" class="control-label mb-1">Standard</label>
                                           <asp:DropDownList ID="std1" runat="server" CssClass="form-control" 
                                               DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id" 
                                               AutoPostBack="True">
                                               
                                           </asp:DropDownList>
                                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                               ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                               SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                      </div>

                                      <div class="form-group">
                                              <label  class="control-label mb-1">Subject</label><br />
                                          <asp:DropDownList ID="sub" runat="server" CssClass="form-control" 
                                                  DataSourceID="SqlDataSource3" DataTextField="subjectname" 
                                                  DataValueField="subjectid">
                                          </asp:DropDownList>
                                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                                  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                  SelectCommand="SELECT * FROM [Subject] WHERE ([stdid] = @stdid)">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="std1" Name="stdid" 
                                                      PropertyName="SelectedValue" Type="Int32" />
                                              </SelectParameters>
                                              </asp:SqlDataSource>


                                      </div>


                                      <div class="form-group">
                                          <label  class="control-label mb-1">Date of join</label><br />
                                            <asp:TextBox ID="doj" runat="server" class="form-control"></asp:TextBox>

                                          <ajaxToolkit:CalendarExtender ID="doj_CalendarExtender" runat="server" 
                                              BehaviorID="doj_CalendarExtender" TargetControlID="doj">
                                          </ajaxToolkit:CalendarExtender>

                                      </div>

                                      <div class="form-group">
                                          <label  class="control-label mb-1">Salary</label><br />
                                            <asp:TextBox ID="salary" runat="server" class="form-control"></asp:TextBox>

                                      </div>
                                       <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Address</label>
                                          <asp:TextBox ID="address1" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                      </div>

                                      <div class="form-group">
                                          <label  class="control-label mb-1">Contact No</label><br />
                                            <asp:TextBox ID="mob1" runat="server" class="form-control"></asp:TextBox>

                                      </div>
                                     
                                     <div class="form-group">
                                          <label  class="control-label mb-1">Email Id</label><br />
                                            <asp:TextBox ID="email1" runat="server" class="form-control"></asp:TextBox>

                                      </div>

                                      

                                      <div>
                                          
                                          <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Update Details" onclick="Button1_Click"  />
                                           
                                        <div class="alert alert-success" id="Div2" runat="server" style="margin-top:10px; display:none">
                                        <strong>
                                               <asp:Label ID="Label2" runat="server"></asp:Label></strong> 

                                           </div>
                                      </div>
                                  </form>
                              </div>
                          </div>

                        </div>
                    </div> <!-- .card -->

                  </div><!--/.col-->


    </form>


</asp:Content>

