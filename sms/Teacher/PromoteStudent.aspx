<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="PromoteStudent.aspx.cs" Inherits="Teacher_PromoteStudent" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Promote Student
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                <div class="form-group">
                                <form id="for1" runat="server">
                                <center>
                                <%--<asp:GridView ID="GridView1" runat="server" Width="1000px" 
                                        AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:ImageField DataImageUrlField="studentphoto" HeaderText="Image" 
                                                    SortExpression="studentphoto">
                                                        <ControlStyle Height="100px" Width="100px" />
                                                    </asp:ImageField>

                                        <asp:BoundField DataField="Enrollmentno" HeaderText="Enrollment no" 
                                                    SortExpression="Enrollmentno" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>

                                        <asp:BoundField DataField="roll" HeaderText="Roll no" 
                                                    SortExpression="roll" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>                   

                                        <asp:BoundField DataField="fname" HeaderText="First Name" 
                                                    SortExpression="fname" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>
                                        <asp:BoundField DataField="mname" HeaderText="Middle Name" 
                                                    SortExpression="mname" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>
                                        <asp:BoundField DataField="lname" HeaderText="Last Name" 
                                                    SortExpression="lname" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>
                                        <asp:BoundField DataField="std" HeaderText="Standard" 
                                                    SortExpression="std" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>
                                        <asp:BoundField DataField="marks" HeaderText="Marks" 
                                                    SortExpression="marks" >
                                                    <ControlStyle Width="80px" />
                                                    </asp:BoundField>
                                        <asp:TemplateField HeaderText="Promote Student" ItemStyle-Width="300px">
                                            <ItemTemplate>
                                                <asp:Button ID="Button1" runat="server" Text="Promote" CssClass="btn btn-lg btn-info btn-block"
                                                     Width="200px" 
                                                    onclick="Button1_Click" />
                                            </ItemTemplate>

                                        <ItemStyle Width="300px"></ItemStyle>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <RowStyle HorizontalAlign="Center" />
                                </asp:GridView>
                                </center>--%>
                              
                                
                                <asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
                <th>Image</th>
                <th>Enrollment No</th>
                <th>Roll no</th>
                <th>FirstName</th>
                <th>FatherName</th>
                <th>LastName</th>
                <th>STD</th>
                <th>Marks</th>
                <th>Promotion</th>
              
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("studentphoto")%>' Height="100px" Width="100px"/></td>
        <td><%#Eval("Enrollmentno") %></td>
        <td><%#Eval("roll") %></td>
        <td><%#Eval("fname") %></td>
        <td><%#Eval("mname") %></td>
        <td><%#Eval("lname") %></td>
        <td><%#Eval("std") %></td>
        <td><%#Eval("Percentage") %></td>
        
        
       <td align="center"><a href="Promotion.aspx?id=<%#Eval("Enrollmentno") %>">Promote</a></td>
        

    </tr>
    </ItemTemplate>

    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>
</asp:Repeater>

                                    


                                </form>
                                    
                                </div>
                                
                                </div>
                                </div>
                                </div>
                                </div>
                                </div>
                                

</asp:Content>

