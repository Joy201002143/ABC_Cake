<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ABC_Cake.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .login-container {
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .login-container h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .login-container label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
        }
        .checkbox {
            margin-bottom: 15px;
        }
        .btn-login {
            background-color: #00CC00;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-message {
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server" class="login-container">
        <h2>User Login</h2>
        <asp:Label ID="Label1" runat="server" Text="Username" AssociatedControlID="TextBox1"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Height="35px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="<br/> <br/>Username is required." CssClass="error-message" Display="Dynamic" />

        
        <asp:Label ID="Label2" runat="server" Text="Password" AssociatedControlID="TextBox2" required="true"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password is required.<br/> <br/>" CssClass="error-message" Display="Dynamic" />

        
        <input class="checkbox" type="checkbox" onchange="document.getElementById('TextBox2').type=this.checked? 'text':'password'" />
        Show Password

        <asp:Button CssClass="btn-login" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />

        <div class="login-message">
            Don't have an account yet? <a href="Registration.aspx">Sign Up.</a>
        </div>
    </form>
</body>
</html>
