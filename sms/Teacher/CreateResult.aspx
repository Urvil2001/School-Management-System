<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" Debug="true" AutoEventWireup="true" CodeFile="CreateResult.aspx.cs" Inherits="Teacher_CreateResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3>
                                
                            <center><strong class="card-title">
                                <lable>Create Result Of Student</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                        <div class="form-group">
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                SelectCommand="SELECT [Enrollmentno], [fname], [roll], [mname], [lname] FROM [Student] WHERE (([std] = @std) AND ([div] = @div))">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="std" SessionField="std" Type="Int32" />
                                                    <asp:SessionParameter Name="div" SessionField="div" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                        <table>
                                        <tr>
                                        <td>
                                        <div class="form-group">
                                             Student Name:
                                            <asp:TextBox ID="fname" runat="server" CssClass="form-control" Width="600px"></asp:TextBox>
                                        </div>
                                        </td>
                                        <td rowspan="3">
                                            <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" style="margin-left:100px" />
                                            <asp:Label ID="Label1" runat="server" CssClass="form-control" style="margin-left:100px" width="200px"></asp:Label>
                                        </td>
                                        </tr>
                                        <tr>
                                        
                                        <td>
                                        <div class="form-group">
                                             Father Name:
                                            <asp:TextBox ID="mname" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        </td>
                                        </tr>
                                        <tr>
                                        <td>
                                        <div class="form-group">
                                             Last Name:
                                            <asp:TextBox ID="lname" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        </td>
                                        </tr>
                                        </table>
                                        <br />
                                
                                      
                                        
                                        <center>
                                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="SqlDataSource2" Height="347px" Width="697px">
                                      <Columns>
                                          <asp:BoundField DataField="subjectname" HeaderText="subjectname" 
                                              SortExpression="subjectname" />
                                          <asp:TemplateField HeaderText="Enter Marks">
                                              <ItemTemplate>
                                                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <RowStyle HorizontalAlign="Center" />
                                  </asp:GridView></center>
                                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT [subjectname] FROM [Subject] WHERE ([stdid] = @stdid)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="stdid" SessionField="std" Type="Int32" />
                                      </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />
                                        <center>
                                  <asp:Panel ID="Panel1" runat="server" Visible="false">
                                      <table border="1px solid black" width="697px">
                                          <tr>
                                              <td align="center">
                                                    Total Marks:
                                              </td>
                                              <td align="center">
                                                  <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td align="center">
                                                    Percentage:
                                             </td>
                                              <td align="center">
                                                  <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
                                              </td>
                                          </tr>
                                      </table>
                                        
                                  </asp:Panel>
                                  
                                  </center>
                                  <br />
                                          <div class="form-group">
                                           Out of How Many Marks
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control">
                                            </asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="Button1" runat="server" Text="Create Result" 
                                                CssClass="btn btn-lg btn-info btn-block" onclick="GetTextBoxValues" />
                                        </div>
                                        
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server"></asp:Label>
                                        </div>
                                    </form>
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                


</asp:Content>

