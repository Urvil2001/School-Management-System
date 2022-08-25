<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddTeacher.aspx.cs" Inherits="Admin_AddTeacher" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="server">
<head>
<head id="Head1" runat="server" />
<head />
    </head>
    <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                        
                            <h3><center><strong class="card-title">Add Staff</strong></center></h3>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                
                                  <form id="fo1" runat="server">
                                  <asp:Panel ID="Panel1" runat="server">
                                   
                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">First Name</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator1" runat="server" ErrorMessage="First is empty" 
                                              ControlToValidate="fname" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="fname" runat="server" class="form-control"></asp:TextBox>
                                      </div>

                                       <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Middle Name</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator2" runat="server" ErrorMessage="Middle is empty" 
                                              ControlToValidate="mname" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="mname" runat="server" class="form-control"></asp:TextBox>
                                      </div>
                                     
                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Last Name</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last is empty" 
                                              ControlToValidate="lname" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="lname" runat="server" class="form-control"></asp:TextBox>
                                      </div>
                                    
                                      <div class="form-group">
                                      <label for="cc-payment" class="control-label mb-1">DOB</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator4" runat="server" ErrorMessage="date of birth is empty" 
                                              ControlToValidate="dob" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="dob" runat="server"  class="form-control"  placeholder="MM/DD/YYYY"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="dob_CalendarExtender" runat="server" 
                                BehaviorID="dob_CalendarExtender" TargetControlID="dob">
                            </ajaxToolkit:CalendarExtender>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>

                                       
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Gender</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select gender" 
                                              ControlToValidate="DropDownList1" Font-Bold="True" Font-Italic="True" 
                                              ForeColor="Red" InitialValue="Select Gender">*</asp:RequiredFieldValidator>
                                          <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                              <asp:ListItem>Select Gender</asp:ListItem>
                                              <asp:ListItem>Male</asp:ListItem>
                                              <asp:ListItem>Female</asp:ListItem>
                                          </asp:DropDownList>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Address</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address is empty" 
                                              ControlToValidate="address" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="address" runat="server" class="form-control" 
                                              TextMode="MultiLine" Height="57px"></asp:TextBox>
                                      </div>

                                        <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Contact No</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator7" runat="server" ErrorMessage="Contact No is empty" 
                                              ControlToValidate="mob" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                               ErrorMessage="Invalid number" ControlToValidate="mob" Display="Dynamic" 
                                               Font-Bold="True" ForeColor="Red" ValidationExpression="^[789]\d{9}$">*</asp:RegularExpressionValidator>
                                          <asp:TextBox ID="mob" runat="server" class="form-control" 
                                           ></asp:TextBox>
                                      </div>

                                        <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Email ID</label><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                              ErrorMessage="Email id is required" ControlToValidate="email" 
                                              Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                ErrorMessage="Email id is invalid" ControlToValidate="email" 
                                                Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                          <asp:TextBox ID="email" runat="server" class="form-control" 
                                               ></asp:TextBox>
                                      </div>

                                        <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Date Of Join</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator9" runat="server" ErrorMessage="date of joining is empty" 
                                              ControlToValidate="doj" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:TextBox ID="doj" runat="server" class="form-control" 
                                           ></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="doj_CalendarExtender" runat="server" 
                                                BehaviorID="doj_CalendarExtender" TargetControlID="doj" />
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Select PIC</label><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                              ErrorMessage="Please Upload Photo" ControlToValidate="f2" 
                                              Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:FileUpload ID="f2" runat="server" class="form-control" />
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Upload Qualification</label><asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                              ErrorMessage="Please Upload Qualification" ControlToValidate="f3" 
                                              Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          <asp:FileUpload ID="f3" runat="server" class="form-control" />
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Salary</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator12" runat="server" ErrorMessage="Salary is empty" 
                                              ControlToValidate="salary" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                         <asp:TextBox ID="salary" runat="server" class="form-control" 
                                               ></asp:TextBox>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Security Question</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator13" runat="server" ErrorMessage="Select Security Question" 
                                              ControlToValidate="que" Font-Bold="True" Font-Italic="True" 
                                              ForeColor="Red" InitialValue="Select Question">*</asp:RequiredFieldValidator>
                                         <asp:DropDownList ID="que" runat="server" CssClass="form-control">
                                          <asp:ListItem>Select Question</asp:ListItem>
                                          <asp:ListItem>Who is your best friend?</asp:ListItem>
                                          <asp:ListItem>Your favourite food?</asp:ListItem>
                                           <asp:ListItem>Your childhood name?</asp:ListItem>
                                            <asp:ListItem>Your favourite hero?</asp:ListItem>
                                             <asp:ListItem>Your pet name?</asp:ListItem>
                             </asp:DropDownList>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Security Answer</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator15" runat="server" ErrorMessage="Security Answer empty" 
                                              ControlToValidate="ans" Font-Bold="True" Font-Italic="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                         <asp:TextBox ID="ans" runat="server" class="form-control" 
                                               ></asp:TextBox>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Select Roll</label><asp:RequiredFieldValidator
                                              ID="RequiredFieldValidator14" runat="server" ErrorMessage="Select Roll" 
                                              ControlToValidate="role" Font-Bold="True" Font-Italic="True" 
                                              ForeColor="Red" InitialValue="Choose Role">*</asp:RequiredFieldValidator>
                                         <asp:DropDownList ID="role" runat="server" CssClass="form-control" 
                                             >
                                                  <asp:ListItem>Choose Role</asp:ListItem>
                                                  <asp:ListItem>Teacher</asp:ListItem>
                                                  <asp:ListItem>Accountant</asp:ListItem>
                                                  <asp:ListItem>Admin</asp:ListItem>
                             </asp:DropDownList>
                                      </div>



                                      <div>
                                          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Add Teacher" onclick="b1_Click" />
                                      </div>

                                       <div class="alert alert-success" id="msg1" runat="server" style="margin-top:10px; display:none">
                                       <strong>Your Books Added Successfully</strong> 
                                       </div>
                                      
                                        </asp:Panel>
                                  <asp:Panel ID="Panel2" runat="server">
                                  
                                   <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Select Standard</label>
                                         <asp:DropDownList ID="std" runat="server" CssClass="form-control" 
                                              DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id" 
                                              AutoPostBack="True">
                                         </asp:DropDownList>
                                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                              ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                              SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Select Subject</label>
                                         <asp:DropDownList ID="subject" runat="server" CssClass="form-control" 
                                              DataSourceID="SqlDataSource2" DataTextField="subjectname" 
                                              DataValueField="subjectid" >
                                              
                                         </asp:DropDownList>
                                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                              ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                              SelectCommand="SELECT * FROM [Subject] WHERE ([stdid] = @stdid)">
                                           <SelectParameters>
                                               <asp:ControlParameter ControlID="std" Name="stdid" PropertyName="SelectedValue" 
                                                   Type="Int32" />
                                           </SelectParameters>
                                          </asp:SqlDataSource>
                                      </div>
                                      <h3>Class Teacher</h3>
                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Select Standard</label>
                                         <asp:DropDownList ID="cstd" runat="server" CssClass="form-control" 
                                              DataSourceID="SqlDataSource3" DataTextField="id" DataValueField="id" 
                                              AutoPostBack="True">
                                        </asp:DropDownList>
                                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                              ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                              SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>
                                      </div>

                                      <div class="form-group">
                                          <label for="cc-payment" class="control-label mb-1">Select Division</label>
                                          <asp:DropDownList ID="div" runat="server" CssClass="form-control" 
                                      DataSourceID="SqlDataSource4" DataTextField="divname" 
                                            DataValueField="divid">
                                </asp:DropDownList>
                                  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                      ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                      SelectCommand="SELECT * FROM [Division] WHERE ([std] = @std)">
                                      <SelectParameters>
                                          <asp:ControlParameter ControlID="cstd" Name="std" 
                                              PropertyName="SelectedValue" Type="Int32" />
                                      </SelectParameters>
                                        </asp:SqlDataSource>
                                          </div>

                                           <div>
                                          
                                          <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Add Teacher" onclick="Button1_Click" />
                                      </div>

                                  </asp:Panel>
                                  </form>
                              </div>
                          </div>

                        </div>
                    </div> <!-- .card -->

                  </div><!--/.col-->

</asp:Content>

