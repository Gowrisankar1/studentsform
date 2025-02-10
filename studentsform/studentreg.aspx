<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentreg.aspx.cs" Inherits="studentsform.studentreg" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Student Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Student Registration Form</h2>
        <form id="registrationForm" runat="server" class="needs-validation">
            <div class="mb-3">
                <label for="studentId" class="form-label">Student ID</label>
                <asp:TextBox ID="txtStudentId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="firstName" class="form-label">First Name <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="age" class="form-label">Age <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" TextMode="Number" Required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="dob" class="form-label">Date of Birth <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" Required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="gender" class="form-label">Gender <span class="text-danger">*</span></label>
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                    <asp:ListItem Text="Other" Value="Other" />
                </asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email ID <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number <span class="text-danger">*</span></label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" TextMode="Phone" Required="true"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Qualification Details</label>
                <div id="qualificationSection">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" Placeholder="Course Name"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPercentage" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Percentage"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtYearOfPassing" runat="server" CssClass="form-control" TextMode="Number" Placeholder="Year of Passing"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <button type="button" id="addQualification" class="btn btn-primary">Add Qualification</button>
            </div>
            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />            
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Login.aspx" CssClass="link">Login</asp:LinkButton>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function () {
            // Add Qualification Dynamically
            $('#addQualification').click(function () {
                const newRow = `
                <div class="row mb-3">
                    <div class="col-md-4">
                        <input type="text" class="form-control" placeholder="Course Name" />
                    </div>
                    <div class="col-md-4">
                        <input type="number" class="form-control" placeholder="Percentage" />
                    </div>
                    <div class="col-md-4">
                        <input type="number" class="form-control" placeholder="Year of Passing" />
                    </div>
                </div>`;
                $('#qualificationSection').append(newRow);
            });

            // jQuery Validation
            $("#registrationForm").validate({
                rules: {
                    firstName: "required",
                    age: "required",
                    dob: "required",
                    gender: "required",
                    email: {
                        required: true,
                        email: true
                    },
                    phoneNumber: {
                        required: true,
                        digits: true,
                        minlength: 10,
                        maxlength: 10
                    }
                },
                messages: {
                    firstName: "Please enter your first name",
                    age: "Please enter your age",
                    dob: "Please select your date of birth",
                    gender: "Please select your gender",
                    email: "Please enter a valid email address",
                    phoneNumber: "Please enter a valid 10-digit phone number"
                },
                errorClass: "text-danger"
            });
        });
    </script>
</body>
</html>
