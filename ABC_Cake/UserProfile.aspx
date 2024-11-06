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
            display: flex;
            justify-content: center;
            height: 100vh;
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
            width: 100%;
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
            /*            border-radius: 8px;*/
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

        .auto-style1 {
            width: 67%;
        }

        table, th, td {
            width: 50%;
        }

        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .form-section {
            background-color: #ffffff;
            padding: 20px 40px;
            /*        border-radius: 8px;*/
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        .form-title {
            font-size: 24px;
            color: #333333;
            margin-bottom: 20px;
            text-align: center;
        }

        .info-table {
            width: 100%;
            /*        border-collapse: collapse;*/
        }

            .info-table td {
                padding: 10px;
            }

        .label-cell {
            font-weight: bold;
            color: #666666;
            width: 40%;
        }

        .input-field {
            width: 100%;
            padding: 8px 10px;
            font-size: 16px;
            /*        border: 1px solid #ddd;*/
            /*        border-radius: 4px;*/
            transition: border-color 0.3s;
        }

            .input-field:focus {
                border-color: #007bff;
                outline: none;
            }

        .read-only {
            background-color: #f1f1f1;
            color: #999;
        }

        .button {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 5px;
            color: #fff;
        }

        .primary {
            background-color: #007bff;
        }

            .primary:hover {
                background-color: #0056b3;
            }

        .secondary {
            background-color: #28a745;
        }

            .secondary:hover {
                background-color: #218838;
            }

        .auto-style3 {
            height: 70px;
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
                    <!-- Use an icon or FontAwesome icon class here -->
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
                <h2 class="form-title">User Information</h2>
                <table class="info-table">
                    <tr>
                        <td class="label-cell">Username</td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" ReadOnly="true" CssClass="input-field read-only" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Contact Number</td>
                        <td>
                            <asp:TextBox ID="txtContact" runat="server" CssClass="input-field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date of Birth</td>
                        <td>
                            <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="input-field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;" class="auto-style3">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="button primary" OnClick="btnEdit_Click" />
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button secondary" OnClick="btnSave_Click" Visible="false" />
                            <asp:Button ID="btnEdit0" runat="server" Text="Order History" CssClass="button primary" OnClick="btnHistory_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="grid-section">
            <h2 class="grid-label">Order History</h2>
            <asp:GridView ID="GridViewOrders" runat="server" CssClass="auto-style1" AutoGenerateColumns="False" Width="1276px" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="false">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Amount" />
                    <asp:BoundField DataField="StatusName" HeaderText="Status" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
