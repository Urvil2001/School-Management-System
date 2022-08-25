<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Student_Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Your Attendance Status</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                        <div class="form-group">
                                            <label style="color:Green">Present Days in this month : <asp:Label ID="Label1" runat="server"></asp:Label></label><br />
                                            <label style="color:Red">Absent Days in this month : <asp:Label ID="Label2" runat="server"></asp:Label></label>
                                        </div>
                                       <div class="form-group" style="width:1000px" align="center" >
                                           <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True">
                                                        <asp:ListItem Value="1">Jan</asp:ListItem>
                                                        <asp:ListItem Value="2">Feb</asp:ListItem>
                                                        <asp:ListItem Value="3">March</asp:ListItem>
                                                        <asp:ListItem Value="4">April</asp:ListItem>
                                                        <asp:ListItem Value="5">May</asp:ListItem>
                                                        <asp:ListItem Value="6">June</asp:ListItem>
                                                        <asp:ListItem Value="7">July</asp:ListItem>
                                                        <asp:ListItem Value="8">Aug</asp:ListItem>
                                                        <asp:ListItem Value="9">Sep</asp:ListItem>
                                                        <asp:ListItem Value="10">Oct</asp:ListItem>
                                                        <asp:ListItem Value="11">Nov</asp:ListItem>
                                                        <asp:ListItem Value="12">Dec</asp:ListItem>
                                           </asp:DropDownList>
                                        </div>

                                        <div class="form-group">
                                                        <center>
                                                            <asp:GridView ID="GridView1" runat="server" Width="801px" 
                                                                EmptyDataText="No Record Found...">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <RowStyle HorizontalAlign="Center" />
                                                            </asp:GridView>
                                                        </center>

                                            </div>
                                            </form>
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                   
                                    
</asp:Content>

