<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Accountant_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                        </div>
                    </div>
</asp:Content>

