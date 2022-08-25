<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Teacher_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<form runat="server">
<div class="col-lg-12">
           <div class="card">
           <br />
 <div class="col-lg-4 col-md-6">
                        <section class="card">
                            <div class="twt-feed blue-bg">
                                <div class="corner-ribon black-ribon">
                                    <i class="fa fa-twitter"></i>
                                </div>
                                <div class="fa fa-twitter wtt-mark"></div>

                                <div class="media">
                                    <a href="#">
                                        <asp:Image ID="Image1" runat="server" class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt=""></asp:Image>
                                        
                                    </a>
                                    <div class="media-body">
                                        <h2 class="text-white display-6"><asp:Literal ID="Literal1" runat="server"></asp:Literal></h2>
                                        <p class="text-light">Teacher👨‍🏫👩‍🏫</p>
                                    </div>
                                </div>



                            </div>
                            <div class="weather-category twt-category">
                                <ul>
                                    <li class="active">
                                        <h5><asp:Label ID="Label3" runat="server"></asp:Label></h5>
                                        Present Days
                                    </li>
                                    <li>
                                        <h5><asp:Label ID="Label1" runat="server"></asp:Label></h5>
                                        Absent Days
                                    </li>
                                    <li>
                                        <h5><asp:Label ID="Label4" runat="server"></asp:Label></h5>
                                        Leave Days
                                    </li>
                                </ul>
                            </div>
                            <div class="twt-write col-sm-12">
                                <asp:TextBox ID="TextBox1" runat="server" rows="1" class="form-control t-text-area" ReadOnly="true"></asp:TextBox>
                                
                            </div>
                            <br />
                        </section>
                    </div>
                    </div>
                    </div>
                    


 </form>
 
 

</asp:Content>

