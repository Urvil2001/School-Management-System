<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="UploadAssignemnt.aspx.cs" Inherits="Student_UploadAssignemnt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="col-lg-12">
           <div class="card">
                        <div class="card-header">
                            <h3><center><strong class="card-title">
                                <lable>Submit Your Assignment</lable></strong></center>

                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                         <div id="pay-invoice">
                              <div class="card-body">
                              <form id="fo1" runat="server">
                              <div class="form-group">
                              <label>Select Subject</label>
                              <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource2" DataTextField="subjectname" CssClass="form-control"
        DataValueField="subjectid">
    </asp:DropDownList>
    </div>
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Subject] WHERE ([stdid] = @stdid)">
        <SelectParameters>
            <asp:SessionParameter Name="stdid" SessionField="std" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="form-group">
    <label>Select Assignment</label>
<asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" 
        AutoPostBack="True" onload="DropDownList1_Load" CssClass="form-control" 
        ontextchanged="DropDownList1_TextChanged">
    </asp:DropDownList>
    </div>
       
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Select File"></asp:Label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                      </div
    <div>
    
    <asp:Button ID="Button1" runat="server" Text="Submit Assignment" onclick="Button1_Click" class="btn btn-lg btn-info btn-block"  />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [PDFfiles] WHERE ([subjectid] = @subjectid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="subjectid" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </form>
    </div>
    </div></div></div>
    </div>
</asp:Content>

