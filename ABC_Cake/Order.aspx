﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ABC_Cake.Order" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABC Cake Shop - Order</title>
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
                .sidebar {
    width: 70px;
    background-color: #333;
    color: white;
    height: 100vh; 
    position: fixed; 
    top: 0;
    left: 0;
    transition: width 0.3s;
    padding-top: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.sidebar a {
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    padding: 15px 10px;
    text-decoration: none;
    font-size: 18px;
    transition: background-color 0.3s;
}

.sidebar a .icon {
    font-size: 24px;
}

.sidebar a .text {
    writing-mode: horizontal-tb;
    
    margin-top: 5px;           
    font-size: 16px;
}

.sidebar:hover {
    width: 200px;
}

.sidebar:hover .text {
    display: inline-block; 
}
.sidebar a .text {
    display: none; 
    writing-mode: horizontal-tb; 
    text-orientation: mixed;   
    margin-top: 5px;           
    font-size: 16px;
}

        .sidebar i {
            font-size: 20px;
            margin-right: 10px;
        }
        .sidebar .link-text {
            opacity: 0;
            transition: opacity 0.3s;
            white-space: nowrap;
        }
        .sidebar:hover .link-text {
            opacity: 1;
        }
    
        .content {
            margin-left: 70px;
            padding: 20px;
            width: calc(100% - 70px);
            transition: margin-left 0.3s;
        }
        .sidebar:hover ~ .content {
            margin-left: 200px;
            width: calc(100% - 200px);
        }
        .form-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
        .form-section select, .form-section input[type="text"], .form-section input[type="tel"] {
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
        
.grid-section {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); 
    gap: 20px;
    width: 100%;
    max-width: 1200px; 
}

.grid-item {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    border-radius: 8px;
    overflow: hidden;
}


.styled-grid {
    width: 100%;
    border-collapse: collapse;
    background-color: #ffffff;
}

.styled-grid th {
    background-color: #4CAF50; 
    color: white;
    padding: 8px;
    text-align: left;
}

.styled-grid td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.styled-grid tr:hover {
    background-color: #f5f5f5; 
}

.styled-grid tr:nth-child(even) {
    background-color: #f2f2f2; 
}


.total-price-label {
    font-size: 1.2em;
    font-weight: bold;
    color: #333;
    margin: 20px 0;
}


.confirm-button {
    padding: 10px 20px;
    font-size: 1em;
    color: #fff;
    background-color: #4CAF50;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.confirm-button:hover {
    background-color: #45a049;
}

        .auto-style2 {
            height: 39px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">ABC Cake Shop - Order Your Custom Cake</div>
                <div class="container">
            <div class="sidebar">
    <a href="UserProfile.aspx">
        <span class="icon">🏠</span> 
        <span class="text">Home</span>
    </a>
    <a href="Order.aspx">
        <span class="icon">🛒</span>
        <span class="text">Order</span>
    </a>
    <a href="AboutUs.aspx">
        <span class="icon">ℹ️</span>
        <span class="text">About</span>
    </a>
    <a href="Contact.aspx">
        <span class="icon">📞</span>
        <span class="text">Contact</span>
    </a>
    <a href="Logout.aspx">
        <span class="icon">🚪</span>
        <span class="text">Logout</span>
    </a>
</div>
</div> 
            <div class="content">
                <div class="form-section">
                    <h2>Make Your Favourite Cake</h2>
                    <table>
                        <tr>
                            <td>Cake Flavor</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
                                    <asp:ListItem Text="Select Decoration" Value="" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Cake Sizes</td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Cake Shapes</td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Cake Colors</td>
                            <td>
                                <asp:DropDownList ID="DropDownList4" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Cake Fillings</td>
                            <td>
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Cake Decoration Type</td>
                            <td>
                                <asp:DropDownList ID="DropDownList6" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Cake Size</td>
                            <td class="auto-style2">
                                <asp:DropDownList ID="DropDownList7" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Delivery Address</td>
                            <td>
                                <asp:TextBox ID="txtDeliveryAddress" runat="server" TextMode="MultiLine" Rows="3" AutoPostBack="true" OnTextChanged="txtDeliveryAddress_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;">
                                <asp:Button ID="Button1" runat="server" Text="Add to Order" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="grid-section">
    <div class="grid-container">
        <div class="grid-item">
            <asp:GridView ID="GridView1" runat="server" CssClass="styled-grid"></asp:GridView>
        </div>
        <div class="grid-item">
            <asp:GridView ID="GridView2" runat="server" CssClass="styled-grid"></asp:GridView>
        </div>
        <div class="grid-item">
            <asp:GridView ID="GridView3" runat="server" CssClass="styled-grid"></asp:GridView>
        </div>
        <div class="grid-item">
            <asp:GridView ID="GridView4" runat="server" CssClass="styled-grid"></asp:GridView>
        </div>
        <div class="grid-item">
            <asp:GridView ID="GridView5" runat="server" CssClass="styled-grid"></asp:GridView>
        </div>
        <div class="grid-item">
            <asp:GridView ID="GridView6" runat="server" CssClass="styled-grid"></asp:GridView>
        </div>
    </div>
    <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price: $0" CssClass="total-price-label"></asp:Label>
    <br />
    <asp:Button ID="ConfirmButton" runat="server" Text="Confirm Order" OnClick="ConfirmButton_Click" CssClass="confirm-button" Visible="false" />
</div>

            </div>
        </div>
    </form>
</body>
</html>
