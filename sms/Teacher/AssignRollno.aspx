<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="AssignRollno.aspx.cs" Inherits="Teacher_AssignRollno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3>
                                
                            <center><strong class="card-title">
                                <lable>Assignroll Number & Division to Student</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                  <asp:Panel ID="Panel1" runat="server">
                                 
                                        <div class="form-group">
                                               <asp:FormView ID="FormView1" runat="server" DataKeyNames="Enrollmentno" 
          DataSourceID="SqlDataSource1" AllowPaging="True" 
           Width="500px" onpageindexchanging="FormView1_PageIndexChanging">
           
          <EditItemTemplate>
          <div class="container">
                <div class="row">
                    <div class="col-md-12">
              Enrollmentno:
              <asp:Label ID="EnrollmentnoLabel1" runat="server" 
                  Text='<%# Eval("Enrollmentno") %>' />
              <br />
              fname:

              <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' CssClass="form-control" />
              <br />
              mname:
              <asp:TextBox ID="mnameTextBox" runat="server" Text='<%# Bind("mname") %>' />
              <br />
              lname:
              <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
              <br />
              dob:
              <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
              <br />
              gender:
              <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
              <br />
              address:
              <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
              <br />
              email:
              <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
              <br />
              <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                  CommandName="Update" Text="Update" />
              &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                  CausesValidation="False" CommandName="Cancel" Text="Cancel" />
          </EditItemTemplate>
                                                   <FooterStyle Font-Bold="True" />
          <InsertItemTemplate>
              fname:
              <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
              <br />
              mname:
              <asp:TextBox ID="mnameTextBox" runat="server" Text='<%# Bind("mname") %>' />
              <br />
              lname:
              <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
              <br />
              dob:
              <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
              <br />
              gender:
              <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
              <br />
              address:
              <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
              <br />
              email:
              <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
              <br />
              <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                  CommandName="Insert" Text="Insert" />
              &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                  CausesValidation="False" CommandName="Cancel" Text="Cancel" />
          </InsertItemTemplate>
          <ItemTemplate>
            
              Enrollmentno:
              <asp:Label ID="EnrollmentnoLabel" runat="server" 
                  Text='<%# Eval("Enrollmentno") %>' CssClass="form-control" />
              <br />
              
              First Name:
              <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' CssClass="form-control" />
              <br />
              Middle Name:
              <asp:Label ID="mnameLabel" runat="server" Text='<%# Bind("mname") %>' CssClass="form-control" />
              <br />
              Last Name:
              <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' CssClass="form-control" />
              <br />
              Date of Birth:
              <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' CssClass="form-control" />
              <br />
              Gender:
              <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' CssClass="form-control" />
              
              <br />
              Email:
              <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' CssClass="form-control" />
              <br />
               Roll No:
              <asp:Label ID="Label1" runat="server" Text='<%# Bind("roll") %>' CssClass="form-control" />
              <br />
              Roll No:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Assign Roll No." ForeColor="red" ControlToValidate="TextBox1" Text="*"></asp:RequiredFieldValidator><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
              
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
              <br />

              <br />
              
              <asp:Label ID="Label2" runat="server" Visible="true"></asp:Label>
              </div>
          </div></div>
          </ItemTemplate>
          
        </asp:FormView>
                                  </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
          
          SelectCommand="SELECT [Enrollmentno], [fname], [mname], [lname],CONVERT(varchar(10),[dob],110) as [dob], [gender], [phno], [email], [roll] FROM [Student] WHERE ([std] = @std) ORDER BY fname ">
        <SelectParameters>
            <asp:SessionParameter Name="std" SessionField="std" Type="Int32" />
        </SelectParameters>
      </asp:SqlDataSource>
      <br />
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
          SelectCommand="SELECT [divname] FROM [Division] WHERE ([std] = @std)">
          <SelectParameters>
              <asp:SessionParameter Name="std" SessionField="std" Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
                        <asp:Button ID="Button1" runat="server"  Text="Assign Div & Roll No" Width="1000px" 
                                                   CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click1" />
   
                                        </div>

                       <div class="alert alert-danger" id="error" runat="server" style="margin-top:10px; display:none">
                       <strong>
                           <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                       </div>
                                    </form>
                                </div>
                        </div>
                        </div>
                        </div>
                        </div>
                        


</asp:Content>

