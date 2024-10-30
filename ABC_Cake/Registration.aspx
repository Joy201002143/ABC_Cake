<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ABC_Cake.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif; /* Font style for the body */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
            margin: 0;
            background-color: #f4f4f4; /* Light background color */
        }
        .registration-container {
            background-color: white; /* White background for the container */
            padding: 30px; /* Padding around the container */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow effect */
            width: 350px; /* Fixed width for better alignment */
            text-align: center; /* Center text */
        }
        .registration-header {
            font-size: 24px; /* Larger font size for the header */
            margin-bottom: 20px; /* Space below the header */
            color: #333; /* Dark text color */
        }
        .form-group {
            margin-bottom: 15px; /* Space between form fields */
            display: flex; /* Use flexbox for alignment */
            flex-direction: column; /* Stack label and input vertically */
            align-items: flex-start; /* Align items to the left */
        }
        label {
            margin-bottom: 5px; /* Space between label and input */
            font-weight: bold; /* Bold text for labels */
            color: #555; /* Medium text color for labels */
            width: 100%; /* Full width for the label */
        }
        input[type="text"], input[type="password"], select {
            padding: 10px; /* Padding inside input fields */
            border: 1px solid #ccc; /* Light border for input fields */
            border-radius: 4px; /* Rounded corners for input fields */
            width: 100%; /* Full width for input fields */
            box-sizing: border-box; /* Include padding and border in element's total width */
        }
        .btn-register {
            background-color: #28a745; /* Green background for button */
            color: white; /* White text color */
            border: none; /* No border */
            padding: 10px 15px; /* Padding inside button */
            border-radius: 5px; /* Rounded corners for button */
            cursor: pointer; /* Pointer cursor on hover */
            margin-top: 15px; /* Space above the button */
            font-size: 16px; /* Font size for button */
            width: 100%; /* Full width for the button */
        }
        .btn-register:hover {
            background-color: #218838; /* Darker green on hover */
        }
        .login-message {
            margin-top: 20px; /* Space above login message */
            font-size: 14px; /* Font size for message */
            color: #666; /* Lighter text color for message */
        }
        a {
            color: #007bff; /* Link color */
            text-decoration: none; /* No underline */
        }
        a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <div class="registration-header">
                User Registration
            </div>
            <div class="form-group">
                <label for="TextBox2">User Name:</label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="TextBox5">Password:</label>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                
                </div>
   <input class="checkbox" type="checkbox" onchange="document.getElementById('TextBox5').type=this.checked? 'text':'password'" /> Show Password
   <br />
            <div>
            </div>

            <div class="form-group">
                <label for="TextBox7">Contact:</label>
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="DropDownList1">Sex:</label>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="TextBox6">Date of Birth:</label>
                <asp:TextBox ID="TextBox6" runat="server" TextMode="Date" Width="340px"></asp:TextBox>
            </div>
            <asp:Button ID="ButtonRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="ButtonRegister_Click" />
            <div class="login-message">
                Already have an account? <a href="Login.aspx">Please login.</a>
            </div>
        </div>
    </form>
</body>
</html>
