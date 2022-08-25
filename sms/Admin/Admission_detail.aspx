<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admission_detail.aspx.cs" Inherits="Admin_student_detail" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <asp:Label ID="Label1" runat="server" Text="Label"> </asp:Label> Details</strong></h3></center>
                                <center><h5><asp:Label ID="std" runat="server" Text="Label"> </asp:Label> standard</strong></h5></center>
                                

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
                                        <td align="center" style="width:350px"> 
                                          <strong><label for="cc-payment" class="control-label mb-1">Father Name</label></strong>
                                            <asp:TextBox ID="mname" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>

                                        <td align="center" style="width:350px">
                                          <strong><label for="cc-payment" class="control-label mb-1">Last Name</label></strong>
                                            <asp:TextBox ID="lname" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                        
                                        <td align="center" style="width:250px;margin-left:-100px">
                                          <strong><label for="cc-payment" class="control-label mb-1">DOB</label></strong>
                                            <asp:TextBox ID="dob" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td align="center" style="width:250px"> 
                                          <strong><label for="cc-payment" class="control-label mb-1">Gender</label></strong>
                                            <asp:TextBox ID="gender" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td align="center" style="width:250px"> 
                                          <strong><label for="cc-payment" class="control-label mb-1">Previous School name</label></strong>
                                            <asp:TextBox ID="pschoolname" runat="server" class="form-control" 
                                                style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>

                                         <tr>
                                            <td colspan="3">
                                                <br />
                                            </td>
                                        </tr>

                                        </tr>
                                             <td align="center" style="width:250px;margin-left:-100px" colspan="3">
                                          <strong><label for="cc-payment" class="control-label mb-1">Address</label></strong>
                                            <asp:TextBox ID="address" runat="server" class="form-control" TextMode="MultiLine" 
                                                     style="text-align:center" ReadOnly="True"></asp:TextBox>
                                        </td>
                                         <tr>
                                            <td colspan="3">
                                                <br />
                                            </td>
                                         </tr>    

                                         <tr>
                                               <td align="center" style="width:250px;margin-left:-100px">
                                               <strong><label for="cc-payment" class="control-label mb-1">Contact No</label></strong>
                                               <asp:TextBox ID="mobno" runat="server" class="form-control" 
                                                       style="text-align:center" ReadOnly="True"></asp:TextBox>
                                               </td>
                                               <td align="center" style="width:250px;margin-left:-100px">
                                               <strong><label for="cc-payment" class="control-label mb-1">Email</label></strong>
                                               <asp:TextBox ID="emailid" runat="server" class="form-control" 
                                                       style="text-align:center" ReadOnly="True"></asp:TextBox>
                                               </td>
                                               <td align="center" style="width:250px;margin-left:-100px">
                                               <strong><label for="cc-payment" class="control-label mb-1">Verified</label></strong>
                                               <asp:TextBox ID="verified" runat="server" class="form-control" 
                                                       style="text-align:center" ReadOnly="True"></asp:TextBox>
                                               </td>
                                         </tr>

                                         <tr>
                                            <td colspan="3">
                                                <br />
                                            </td>
                                         </tr>

                                          <tr>
                                              <asp:ScriptManager ID="ScriptManager1" runat="server">
                                              </asp:ScriptManager>
                                               <td align="center" style="width:250px;margin-left:-100px">
                                               <strong><label for="cc-payment" class="control-label mb-1">Student Photo</label></strong>
                                               <br />
                                               <asp:Image ID="Image1" runat="server" Width="100px" />

                                                   <ajaxToolkit:AnimationExtender ID="Image1_AnimationExtender" runat="server" 
                                                       BehaviorID="Image1_AnimationExtender" TargetControlID="Image1">
                                                       <Animations>
                                                       <OnMouseOver>
                                                            <Resize AnimationTarget="Image1" width="250" height="250" unit="px"></Resize>
                                                            </OnMouseOver>
                                                            <OnMouseOut>
                                                              <Resize AnimationTarget="Image1" width="100" height="100" unit="px"></Resize>
                                                            </OnMouseOut>
                                                            </Animations>
                                                   </ajaxToolkit:AnimationExtender>

                                               </td>
                                               <td align="center" style="width:250px;margin-left:-100px">
                                               <strong><label for="cc-payment" class="control-label mb-1">Birth Certificate</label></strong>
                                              <br />
                                               <asp:Image ID="Image2" runat="server" Width="100px" />
                                                   <ajaxToolkit:AnimationExtender ID="Image2_AnimationExtender" runat="server" 
                                                       BehaviorID="Image2_AnimationExtender" TargetControlID="Image2">
                                                       <Animations>
                                                       <OnMouseOver>
                                                            <Resize AnimationTarget="Image2" width="250" height="250" unit="px"></Resize>
                                                            </OnMouseOver>
                                                            <OnMouseOut>
                                                              <Resize AnimationTarget="Image2" width="100" height="100" unit="px"></Resize>
                                                            </OnMouseOut>
                                                            </Animations>
                                                   </ajaxToolkit:AnimationExtender>
                                               </td>
                                               <td align="center" style="width:250px;margin-left:-100px">
                                               <strong><label for="cc-payment" class="control-label mb-1">Previous Year Marksheet</label></strong>
                                               <br />
                                               <asp:Image ID="Image3" runat="server" Width="100px" />
                                                   <ajaxToolkit:AnimationExtender ID="Image3_AnimationExtender" runat="server" 
                                                       BehaviorID="Image3_AnimationExtender" TargetControlID="Image3">
                                                       <Animations>
                                                       <OnMouseOver>
                                                            <Resize AnimationTarget="Image3" width="250" height="250" unit="px"></Resize>
                                                            </OnMouseOver>
                                                            <OnMouseOut>
                                                              <Resize AnimationTarget="Image3" width="100" height="100" unit="px"></Resize>
                                                            </OnMouseOut>
                                                            </Animations>
                                                   </ajaxToolkit:AnimationExtender>
                                               </td>
                                         </tr>
                                        </table>
                                        <br />
                                        <br />
                                         <div>
                                          
                                          <table>
                                          <tr>
                                          <td>
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Approved" onclick="b1_Click" Width="500px" style="background-color:Green" />
                                        </td>
                                        <td>
                                         <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Disapproved" Width="500px" style="background-color:Red" 
                                                onclick="Button1_Click" />
                                              </td>
                                              </tr>
                                                
                                        </table>
                                      </div>
                                    </div>
                                    </form>
                                    </div>
                                    </div>
                              </div>
                              </div>
                              </div>
</asp:Content>

