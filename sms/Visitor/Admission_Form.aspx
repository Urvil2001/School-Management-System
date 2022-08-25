<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admission_Form.aspx.cs" Inherits="Visitor_Student_Admission" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head runat="server">

      <script src="js/sweet.js" type="text/javascript"></script>
    <script>
        function alertme() {
            swal({
           title: 'Good job!',
           text: 'Your admission form has been submitted successfully',
           type:'success'
        }).then(function(){window.location="Home.aspx";})
        }
            function wrong() {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Something went wrong!',
                })
            }

    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Student Registration Form</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="../apple-icon.png">
    <link rel="shortcut icon" href="../favicon.ico">

    <link rel="stylesheet" href="../assets/css/normalize.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="../assets/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="../assets/scss/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body class="bg-dark">



    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                    <a href="index.html">
                        <h1 style="color:White">Student Admission Form</h1>
                    </a>
                </div>


                <div class="login-form">
                    <form id="form1" runat="server">
                    <asp:Panel ID="Panel1" runat="server">
                    
                        <div class="form-group">
                            <label>First Name</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="First name is required" ControlToValidate="firstname" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="firstname" runat="server" class="form-control"  placeholder="First Name"></asp:TextBox>
                        </div>

                         <div class="form-group">
                            <label>Father Name</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Father name is required" ControlToValidate="fathername" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="fathername" runat="server"  class="form-control"  
                                placeholder="Father Name" ></asp:TextBox>

                        <div class="form-group">
                            <label>Last Name</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Last name is required" ControlToValidate="lastname" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="lastname" runat="server"  class="form-control"  
                                placeholder="Last Name" ></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>DOB</label><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="date of birth is empty" ControlToValidate="dob" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="dob" runat="server"  class="form-control"  placeholder="MM/DD/YYYY"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="dob_CalendarExtender" runat="server" 
                                BehaviorID="dob_CalendarExtender" TargetControlID="dob">
                            </ajaxToolkit:CalendarExtender>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                        </div>

                         <div class="form-group">
                            <label>Gender</label><asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ErrorMessage="Please select gender" ControlToValidate="gender" 
                        Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="Select Gender">*</asp:RequiredFieldValidator>
                              <asp:DropDownList ID="gender" runat="server" CssClass="form-control" 
                                             >
                                  <asp:ListItem>Select Gender</asp:ListItem>
                                  <asp:ListItem>Male</asp:ListItem>
                                  <asp:ListItem>Female</asp:ListItem>
                             </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>Select Standard</label>
                              <asp:DropDownList ID="std" runat="server" CssClass="form-control" 
                                DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id" 
                                AutoPostBack="True" onselectedindexchanged="std_SelectedIndexChanged1" 
                                ontextchanged="std_TextChanged" >
                             </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                SelectCommand="SELECT * FROM [Std]"></asp:SqlDataSource>

                        </div>

                        <div class="form-group">
                            <label>Previous School Name</label>
                            <asp:TextBox ID="pschoolname" runat="server"  class="form-control"  placeholder="Previous School Name"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Address</label><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Address is mandatory" ControlToValidate="address" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="address" runat="server"  class="form-control"  placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                        </div>

                         <div class="form-group">
                            <label>Contact</label><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ErrorMessage="Please enter a mobile number" ControlToValidate="mob" 
                        Display="Dynamic" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Invalid number" ControlToValidate="mob" Display="Dynamic" 
                        Font-Bold="True" ForeColor="Red" ValidationExpression="^[789]\d{9}$">*</asp:RegularExpressionValidator>
                            <asp:TextBox ID="mob" runat="server"  class="form-control"  placeholder="Mobile Number"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Email Id</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="Email id is required" ControlToValidate="email" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Email id is invalid" ControlToValidate="email" 
                        Display="Dynamic" Font-Bold="True" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            <asp:TextBox ID="email" runat="server"  class="form-control"  
                                placeholder="Email Id" ontextchanged="email_TextChanged" 
                                AutoPostBack="True"></asp:TextBox>
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </div>

                         <div class="form-group">
                            <label>Password</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ErrorMessage="Password is required" ControlToValidate="password" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:TextBox ID="password" runat="server"  class="form-control" TextMode="Password"  placeholder="Password"></asp:TextBox>
                        </div>

                         <div class="form-group">
                            <label>Confirm Password</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Confirm Password is required" ControlToValidate="cpassword" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator> 
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Password and confirm password does not match" 
                        ControlToCompare="password" ControlToValidate="cpassword" Font-Bold="True" 
                        ForeColor="Red">*</asp:CompareValidator>
                            <asp:TextBox ID="cpassword" runat="server"  class="form-control" TextMode="Password"  placeholder="Retype Password"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Select Security Question</label><asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ErrorMessage="Please select security question" ControlToValidate="DropDownList1" 
                        Display="Dynamic" Font-Bold="True" ForeColor="Red" InitialValue="Select Question">*</asp:RequiredFieldValidator>
                              <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                                             >
                                  <asp:ListItem>Select Question</asp:ListItem>
                                  <asp:ListItem>Who is your best friend?</asp:ListItem>
                                  <asp:ListItem>Your favourite food?</asp:ListItem>
                                   <asp:ListItem>Your childhood name?</asp:ListItem>
                                    <asp:ListItem>Your favourite hero?</asp:ListItem>
                                     <asp:ListItem>Your pet name?</asp:ListItem>
                             </asp:DropDownList>
                        </div>

                         <div class="form-group">
                            <label>Security Answer</label><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="ans" ErrorMessage="Enter Security Answer" Text="*" 
                        Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="ans" runat="server"  class="form-control"  placeholder="Answer"></asp:TextBox>
                        </div>

                          <div class="form-group">
                            <label>Birth Certificate</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ErrorMessage="Upload birth certificate" ControlToValidate="f1" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:FileUpload ID="f1" runat="server" />
                        </div>
                         <div class="form-group">
                            <label>Student Image</label> <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ErrorMessage="Upload student photo" ControlToValidate="f2" 
                        Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                            <br />
                            <asp:FileUpload ID="f2" runat="server" />
                        </div>
                          <div class="form-group">
                            <label>Previous Marksheet</label>
                            <br />
                            <asp:FileUpload ID="f3" runat="server" />
                        </div>

                          

                         <div class="form-group">
                           
                           <div id="ReCaptchContainer"></div>
                          <asp:Label ID="lblMessage1" runat="server"></asp:Label>
        
                        </div>


                        <asp:Button ID="b1" runat="server" 
                            class="btn btn-primary btn-flat m-b-30 m-t-30" Text="Register Now" onclick="b1_Click" 
                             />
                        
                         <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />

                      </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                            <div class="form-group">
                            <label>Activation Code</label>
                            <asp:TextBox ID="TextBox1" runat="server"  class="form-control"  placeholder="Answer"></asp:TextBox>
                            </div>

                             <asp:Button ID="Button1" runat="server" 
                            class="btn btn-primary btn-flat m-b-30 m-t-30" Text="Register Now" onclick="Button1_Click"
                             />
                    </asp:Panel>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://www.google.com/recaptcha/api.js?onload=renderRecaptcha&render=explicit" async defer></script>
    <script type="text/javascript">
        var your_site_key = '6Lc1V7MaAAAAAEzi3m4P9MvC2GPMeyC85_jrg_Wa';
        var renderRecaptcha = function () {
            grecaptcha.render('ReCaptchContainer', {
                'sitekey': '6Lc1V7MaAAAAAEzi3m4P9MvC2GPMeyC85_jrg_Wa',
                'callback': reCaptchaCallback,
                theme: 'light', //light or dark
                type: 'image', // image or audio
                size: 'normal'//normal or compact
            });
        };
        var reCaptchaCallback = function (response) {
            if (response !== '') {
                document.getElementById('lblMessage1').innerHTML = "";
            }
        };
       </script>


      
    <script src="../assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="../assets/js/main.js"></script>


</body>
</html><!--6Lf0JbIaAAAAAChC0VGfCjQsKaqC-aIhNT7-soTc-- !>