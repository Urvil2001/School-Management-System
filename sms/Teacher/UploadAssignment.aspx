<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/MasterPage.master" AutoEventWireup="true" CodeFile="UploadAssignment.aspx.cs" Inherits="Teacher_UploadAssignment" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <head runat="server">
    </head>
    <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Upload Assignment</strong>
                        </div>
                        <div class="card-body">
                          <!-- Credit Card -->
                          <div id="pay-invoice">
                              <div class="card-body">
                                  
                                 
                                  <form id="fo1" runat="server">
                                      
                                    <div class="form-group">
                                            Select File
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                      </div>

                                       <div class="form-group">
                                           Due date for submission
                                          <asp:TextBox ID="ddate" runat="server" class="form-control" placeholder="MM/DD/YYYY"></asp:TextBox>
                                           <ajaxToolkit:CalendarExtender ID="ddate_CalendarExtender" runat="server" 
                                               BehaviorID="ddate_CalendarExtender" TargetControlID="ddate" />
                                           <asp:ScriptManager ID="ScriptManager1" runat="server">
                                           </asp:ScriptManager>
                                      </div>                                     
                                      <div>
                                          
                                          <asp:Button ID="b1" runat="server" class="btn btn-lg btn-info btn-block" 
                                              Text="Upload Assignment" onclick="b1_Click"/>
                                               <div class="alert alert-success" id="error" runat="server" style="margin-top:10px; display:none">
                                                <strong>
                                                 <asp:Label ID="Label1" runat="server"></asp:Label></strong> 
                                                 </div>
                                                 <asp:Label ID="Label3" runat="server"></asp:Label></strong>
                                      </div>
                                      <br />
                                      <br />
                                      <div class="form-group">
                                     <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
     BackColor="White" 
    BorderColor="#CC9966" BorderStyle="None" 
    BorderWidth="1px" CellPadding="4" Height="150px" Width="800px"
           onrowcommand="GridView1_RowCommand" AllowPaging="True" 
        >
    <Columns>
        <asp:TemplateField HeaderText="File" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandArgument='<%# Eval("File") %>'
                    CommandName="Download" Text='<%# Eval("File") %>' onclick="LinkButton1_Click" 
                    >
                    </asp:LinkButton>
            </ItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:BoundField DataField="Size" HeaderText="Size in Bytes" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Type" HeaderText="File Type" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
         <asp:BoundField DataField="Date" HeaderText="Date" >
        <HeaderStyle HorizontalAlign="Center" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
       
    </Columns>
    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" 
        ForeColor="#FFFFCC" HorizontalAlign="Center" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
        HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#330099" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" 
        ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />
</asp:GridView></center>
</div>

                                            
                                  </form></div>
                              </div>
                          </div>

                        </div>
                    </div> <!-- .card -->

                  </div><!--/.col-->


</asp:Content>

