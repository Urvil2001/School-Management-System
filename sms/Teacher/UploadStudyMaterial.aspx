<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="UploadStudyMaterial.aspx.cs" Inherits="Teacher_UploadStudyMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Upload Study Material</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form id="fo1" runat="server">
                                      
                                    <div class="form-group">
                                            Select File
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                      </div>
                                     
                                     

                                    <div class="form-group">
                                         <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Upload Study Material" onclick="b1_Click"/>
                                               <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                                <strong>
                                                 <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                                 </div>

                                        </div>

                                        <div class="form-group">
                                         <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
           SelectCommand="SELECT [id], [name], [std], [type], [subjectid] FROM [Study_Material] WHERE ([std] = @std)">
           <SelectParameters>
               <asp:SessionParameter Name="std" SessionField="std" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
       <br />
      
       <center>
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" 
                                                DataSourceID="SqlDataSource5" Width="800px" Height="80px" 
           onrowcommand="GridView2_RowCommand" AllowPaging="True">
           <Columns>
              <asp:TemplateField HeaderText="File Name" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandArgument='<%# Eval("name") %>'
                    CommandName="Download" Text='<%# Eval("name") %>' onclick="LinkButton1_Click" 
                    ForeColor="Blue">
                    </asp:LinkButton>
            </ItemTemplate></asp:TemplateField>
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

