﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ABC_Cake.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif; 
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            margin: 0;
            background-color: #f4f4f4; 
        }
        .registration-container {
            background-color: white; 
            padding: 30px; 
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
            width: 350px; 
            text-align: center; 
        }
        .registration-header {
            font-size: 24px; 
            margin-bottom: 20px; 
            color: #333; 
        }
        .form-group {
            margin-bottom: 15px; 
            display: flex; 
            flex-direction: column; 
            align-items: flex-start; 
        }
        label {
            margin-bottom: 5px; 
            font-weight: bold; 
            color: #555; 
            width: 100%; 
        }
        input[type="text"], input[type="password"], select {
            padding: 10px; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            width: 100%; 
            box-sizing: border-box; 
        }
        .btn-register {
            background-color: #28a745; 
            color: white; 
            border: none; 
            padding: 10px 15px; 
            border-radius: 5px; 
            cursor: pointer; 
            margin-top: 15px; 
            font-size: 16px; 
            width: 100%; 
        }
        .btn-register:hover {
            background-color: #218838; 
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
