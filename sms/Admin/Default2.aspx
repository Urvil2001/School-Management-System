<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">


<asp:Repeater ID="r1" runat="server">
    <HeaderTemplate>

        <table class="table table-bordered" id="example">
        <thead>
            <tr>
                <th>Image</th>
                <th>Enrollment No</th>
                <th>First Name</th>
                <th>Father Name</th>
                <th>Last Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Roll</th>
                <th>STD</th>
                <th>div</th>
                <th>Address</th>
                <th>Mob no</th>
                <th>Email</th>
                <th>Status</th>
                <th>Active</th>    
            </tr>
        </thead>
        <tbody>
    </HeaderTemplate>

    <ItemTemplate>
    <tr>
        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("studentphoto")%>' Height="100px" Width="100px"/></td>
        <td><%#Eval("Enrollmentno") %></td>
        <td><%#Eval("fname") %></td>
        <td><%#Eval("mname") %></td>
        <td><%#Eval("lname") %></td>
        <td><%#Eval("dob") %></td>
        <td><%#Eval("gender") %></td>
        <td><%#Eval("roll") %></td>
        <td><%#Eval("std") %></td>
        <td><%#Eval("div") %></td>
        <td><%#Eval("address") %></td>
        <td><%#Eval("phno") %></td>
        <td><%#Eval("email") %></td>
        <td><%#Eval("activation") %></td>
       
    <td>
      <input type="checkbox" name="status" id="status"/>
      <input type="hidden" name="hidden_status" id="hidden_status" value="Active" />
    
    
    <script>
        $(document).ready(function () {

            $('#status').bootstrapToggle({
                on: 'Active',
                off: 'Deactive',
                onstyle: 'success',
                offstyle: 'danger'
            });

            $('#status').change(function () {
                if ($(this).prop('checked')) {
                    $('#hidden_status').val('Active');
                }
                else {
                    $('#hidden_status').val('Deactive');
                }
            });

            $('#insert_data').on('submit', function (event) {
                event.preventDefault();

                if ($('#hidden_status').val() != '') {
                    var hidden_status = $('#hidden_status').val();


                    $.ajax({

                        url: "insert.php",
                        method: "POST",
                        data: $(this).serialize(),
                        success: function (data) {

                            if (data == 'done') {
                                $('#insert_data')[0].reset();
                                $('#status').bootstrapToggle('on');
                                alert("Data Inserted");
                            }
                        }
                    });
                }
            });

        });


</script>
  
        </td>
    </tr>
    

    </ItemTemplate>

    <FooterTemplate>
        </tbody>
    </table>
    </FooterTemplate>



    


</asp:Repeater>

  


    
</asp:Content>

