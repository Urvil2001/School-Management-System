<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<form id="Form1" runat="server">
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
                                       
                                    </div>
                                </div>



                            </div>
                            <div class="weather-category twt-category">
                                <ul>
                                    <li class="active">
                                        <h5><asp:Label ID="Label8" runat="server"></asp:Label></h5>
                                        Present Days
                                    </li>
                                    <li>
                                        <h5><asp:Label ID="Label9" runat="server"></asp:Label></h5>
                                        Absent Days
                                    </li>
                                    <li>
                                        <h5><asp:Label ID="Label10" runat="server"></asp:Label></h5>
                                        Leave Days
                                    </li>
                                </ul>
                            </div>
                            <br />
                        </section>
                    </div>
                    
                    <div class="col-md-3 col-lg-4">
                        <div class="card text-white bg-flat-color-3">
                            <div class="card-body pb-0">
                                <div class="dropdown float-right">
                                  
                                </div>
                                
                                <h4 class="mb-0">
                                    <p class="text-light">Send Complaint: <span class="count"><asp:Label ID="Label11" runat="server"></asp:Label></asp:Label></span></p>
                                </h4>

                                
                                <h4 class="mb-0">
                                    <p class="text-light">Complaint reply: <span class="count"><asp:Label ID="Label12" runat="server"></asp:Label></asp:Label></span></p>
                                </h4>
                                

                                <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                                    <canvas id="widgetChart2"></canvas>
                                </div>

                            </div>
                        </div>
                    


                        
                    </div>
                    </div>
                          </form>


</asp:Content>

