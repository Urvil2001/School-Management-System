<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="ApplyforLeaveApplication.aspx.cs" Inherits="Teacher_ApplyforLeaveApplication" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<head runat="server"></head>
<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Apply for Leave Application</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                                  <form id="fo1" runat="server">
                                        
                                         <div class="form-group">
                                             Student Name
                                            <asp:TextBox ID="fname" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            Standard
                                            <asp:TextBox ID="std" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="form-group">
                                            Description of Leave Application
                                          <asp:TextBox ID="des" runat="server" ReadOnly="false" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="form-group">
                                            Starting Date
                                            <asp:TextBox ID="leavdate" runat="server"  CssClass="form-control"></asp:TextBox>
                                            
                                            
                                            
                                            <ajaxToolkit:CalendarExtender ID="leavdate_CalendarExtender" runat="server" 
                                                BehaviorID="leavdate_CalendarExtender" TargetControlID="leavdate">
                                            </ajaxToolkit:CalendarExtender>
                                            
                                            
                                            
                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                            </asp:ScriptManager>

                                        </div>
                                        <div class="form-group">
                                            No of Days
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="1">01</asp:ListItem>
                                                <asp:ListItem Value="2">02</asp:ListItem>
                                                <asp:ListItem Value="3">03</asp:ListItem>
                                                <asp:ListItem Value="4">04</asp:ListItem>
                                                <asp:ListItem Value="5">05</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button ID="Button1" runat="server" Text="Submit Your Application" 
                                                CssClass="btn btn-lg btn-info btn-block" onclick="Button1_Click"  />
                                            <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></strong> 
                                            </div>

                                        </div>
                                        </form>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        




</asp:Content>

