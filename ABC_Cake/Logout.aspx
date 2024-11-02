<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="ABC_Cake.Logout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #F4F4F9;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        .logout-message {
            margin-top: 50px;
            font-size: 24px;
        }
        .button {
            padding: 10px 20px;
            font-size: 18px;
            color: white;
            background-color: #4CAF50;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-message">
            <h1>You have successfully logged out.</h1>
            <asp:Button ID="btnLogin" runat="server" Text="Login Again" CssClass="button" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>