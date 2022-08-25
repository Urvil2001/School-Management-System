<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="ViewStudyMatetrial.aspx.cs" Inherits="Student_ViewStudyMatetrial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">View Study Material</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form id="fo1" runat="server">
                                      
                                    <div class="form-group">
                                            Select Subject
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                                DataSourceID="SqlDataSource1" DataTextField="subjectname" 
                                                DataValueField="subjectid" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                SelectCommand="SELECT * FROM [Subject] WHERE ([stdid] = @stdid)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="stdid" SessionField="std" Type="Int32" />
                                            </SelectParameters>
                                            </asp:SqlDataSource>
                                      </div>
                                     
                                     

                                    <div class="form-group">
                                               <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                                <strong>
                                                 <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                                 </div>

                                        </div>

                                        <div class="form-group">
                                         <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
           SelectCommand="SELECT [id], [name], [type] FROM [Study_Material] WHERE ([subjectid] = @subjectid)">
           <SelectParameters>
               <asp:ControlParameter ControlID="DropDownList1" Name="subjectid" 
                   PropertyName="SelectedValue" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
       <br />
      
       <center>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
         DataSourceID="SqlDataSource5" 
         onrowcommand="GridView1_RowCommand" DataKeyNames="id" AllowPaging="True" 
               Height="182px" Width="800px" HorizontalAlign="Center">
         <Columns>
             
             <asp:TemplateField HeaderText="File" ShowHeader="false">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                    CommandArgument='<%# Eval("name") %>' CommandName="Download" 
                    Text='<%# Eval("name") %>' OnClick="LinkButton1_Click" ForeColor="Blue"></asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
             
           
             
            
             <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
             
             
               
         </Columns>
         
         <HeaderStyle BackColor="#F8F9FA" 
             HorizontalAlign="Center" />
         <RowStyle HorizontalAlign="Center" />
     </asp:GridView></center>
                                        </div>

                                        </form>
                                        
                                    </div>
                           </div>
                           </div>
                           </div>
                           </div>
</asp:Content>

