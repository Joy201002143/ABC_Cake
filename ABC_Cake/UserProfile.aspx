<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ABC_Cake.UserProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABC Cake Shop - Profile</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #F4F4F9;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 30px;
        }
        .container {
            display: flex;
        }
        .sidebar {
            width: 200px;
            background-color: #333;
            color: white;
            height: 100vh;
            position: absolute;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
            font-size: 18px;
        }
        .sidebar a:hover {
            background-color: #575757;
        }
        .content {
            margin-left: 220px;
            padding: 20px;
            width: calc(100% - 220px);
        }
        .form-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .form-section h2 {
            font-size: 28px;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }
        .form-section table {
            width: 100%;
            font-size: 18px;
            color: #0066CC;
        }
        .form-section table tr td {
            padding: 8px 0;
        }
        .form-section input[type="text"], .form-section input[type="tel"] {
            width: 100%;
            padding: 8px;
            font-size: 16px;
        }
        .form-section button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            width: 100%;
        }
        .form-section button:hover {
            background-color: #45a049;
        }
        .grid-section {
            margin-top: 20px;
        }
        .grid-section .grid-label {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">ABC Cake Shop - Order Your Custom Cake</div>
        <div class="container">
            <div class="sidebar">
                <a href="UserProfile.aspx">Home</a>
                <a href="Order.aspx">Make Order</a>
                <a href="AboutUs.aspx">About Us</a>
                <a href="Contact.aspx">Contact</a>
                <a href="Logout.aspx">Log Out</a>
            </div>
            <div class="content">
                <div class="form-section">
                    <h2>User Information</h2>
                    <table>
                        <tr>
                            <td>Username</td>
                            <td>
                                <asp:TextBox ID="txtUsername" runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Contact Number</td>
                            <td>
                                <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Date of Birth</td>
                            <td>
                                <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="false" />
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="grid-section">
                    <h2 class="grid-label">Order History</h2>
                    <asp:GridView ID="GridViewOrders" runat="server" CssClass="auto-style1" AutoGenerateColumns="false" Width="1276px">
                        <Columns>
                            <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                            <asp:BoundField DataField="TotalPrice" HeaderText="Total Amount" />
                            <asp:BoundField DataField="StatusName" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
