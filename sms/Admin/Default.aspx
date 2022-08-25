<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
<div class="col-md-6 col-lg-4">
                        <div class="card text-white bg-flat-color-2">
                            <div class="card-body pb-0">
                                <div class="dropdown float-right">
                                    
                                </div>
                                <h4 class="mb-0">
                                    <span class="count"><asp:Label ID="Label3" runat="server"></asp:Label></span>
                                </h4>
                                <p class="text-light">No of Teachers</p>

                                <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                                    <canvas id="widgetChart2"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-4">
                        <div class="card text-white bg-flat-color-4">
                            <div class="card-body pb-0">
                                <div class="dropdown float-right">
                                    
                                </div>
                                <h4 class="mb-0">
                                    <span class="count"><asp:Label ID="Label2" runat="server"></asp:Label></asp:Label></span>
                                </h4>
                                <p class="text-light">No of Students</p>

                                <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                                    <canvas id="widgetChart2"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-lg-4">
                        <div class="card text-white bg-flat-color-3">
                            <div class="card-body pb-0">
                                <div class="dropdown float-right">
                                  
                                </div>
                                <h4 class="mb-0">
                                    <span class="count"><asp:Label ID="Label1" runat="server"></asp:Label></asp:Label></span>
                                </h4>
                                <p class="text-light">No of Accountant</p>

                                <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                                    <canvas id="widgetChart2"></canvas>
                                </div>

                            </div>
                        </div>
                    </div>
                    </div>

                    
<div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">Total Profit</div>
                                        <div class="stat-digit">
                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                  </div>


                 <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="stat-widget-one">
                                    <div class="stat-icon dib"><i class="ti-money text-danger border-danger"></i></div>
                                    <div class="stat-content dib">
                                        <div class="stat-text">Total Spending</div>
                                        <div class="stat-digit">
                                            <asp:Literal ID="Literal2" runat="server"></asp:Literal></div>
                                    </div>
                                </div>
                            </div>
                        </div></div>
                    
                    <div class="card col-md-6 no-padding ">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-comments-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Literal ID="Literal5" runat="server"></asp:Literal></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">Inquiry</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>

                            <div class="card col-md-6 no-padding" style="margin-top:-80px">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-comments-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Literal ID="Literal4" runat="server"></asp:Literal></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">Complaints</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>
                            <div class="card col-md-6 no-padding" style="margin-top:-15px">
                                <div class="card-body">
                                    <div class="h1 text-muted text-right mb-4">
                                        <i class="fa fa-comments-o"></i>
                                    </div>
                                    <div class="h4 mb-0">
                                        <span class="count">
                                            <asp:Literal ID="Literal3" runat="server"></asp:Literal></span>
                                    </div>
                                    <small class="text-muted text-uppercase font-weight-bold">Leave Applications</small>
                                    <div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
                                </div>
                            </div>


  

</asp:Content>

