<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="YourResult.aspx.cs" Inherits="Student_YourResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <label>Result Details</label></strong></center></h3>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                              <form id="fo1" runat="server">
                              <div class="form-group">
                                    <center>
                                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="SqlDataSource2" Height="347px" Width="697px">
                                  <Columns>
                                          <asp:BoundField DataField="subjectname" HeaderText="Subject Name" 
                                              SortExpression="subjectname" />
                                          <asp:TemplateField HeaderText="Marks">
                                              <ItemTemplate>
                                                  <asp:Label ID="Label1" runat="server"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <RowStyle HorizontalAlign="Center" />


                                  </asp:GridView>
                                  </center>
                                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT [subjectname] FROM [Subject] WHERE ([stdid] = @stdid)">
                                      <SelectParameters>
                                          <asp:SessionParameter Name="stdid" SessionField="std" Type="Int32" />
                                      </SelectParameters>
                                        </asp:SqlDataSource>
                                         <br />
                                  <center>
                                 
                                      <asp:GridView ID="GridView2" runat="server" Height="100px" Width="697px" 
                                          DataSourceID="SqlDataSource1">
                                          <HeaderStyle HorizontalAlign="Center" />
                                          <RowStyle HorizontalAlign="Center" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                          SelectCommand="SELECT [Total], [Sum] as [You Got Marks], [Percentage] FROM [Result] WHERE ([rollno] = @rollno)">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="rollno" SessionField="roll" Type="String" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                      <br />
                                      <br />
                                      <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                                  </center>
                              </div>
                            <div class="alert alert-danger" id="error" runat="server" style="margin-top:10px; display:none">
                                               <strong>
                                                   <asp:Label ID="Label2" runat="server"></asp:Label></strong> 
                                               </div>

                              </form>
                              </div>
                              </div>
                              </div>
                              </div>
                              </div>
                              


</asp:Content>

