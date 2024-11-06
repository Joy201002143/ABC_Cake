<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory_Management.aspx.cs" Inherits="ABC_Cake.Inventory_Management" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Management</title>
    <style type="text/css">
        .container {
            padding: 20px;
            margin-top: 30px;
            width: 90%;
            text-align: center;
        }

        h2 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .inventory-panel {
            display: inline-block;
            padding: 20px;
            width: 350px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        .inventory-form {
            display: flex;
            flex-direction: column;
        }

            .inventory-form label, .inventory-form input, .inventory-form select {
                margin: 8px 0;
            }

            .inventory-form input, .inventory-form select {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                font-size: 14px;
                width: 100%;
            }

            .inventory-form button {
                margin-top: 15px;
                padding: 10px;
                font-size: 16px;
                background-color: #2c3e50;
                color: #ecf0f1;
                border: none;
                cursor: pointer;
                border-radius: 4px;
            }

                .inventory-form button:hover {
                    background-color: #34495e;
                }

        .grid-container {
            margin-top: 30px;
        }

        .grid-title {
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

            .grid-view th, .grid-view td {
                padding: 12px;
                border-bottom: 1px solid #ddd;
            }

            .grid-view th {
                background-color: #2c3e50;
                color: #fff;
                font-weight: bold;
            }

            .grid-view tr:nth-child(even) {
                background-color: #f9f9f9;
            }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 60px;
            height: 100vh;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding-top: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
            transition: width 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            overflow: hidden;
            z-index: 1000;
        }

            .sidebar:hover {
                width: 250px;
                padding-left: 10px;
            }

            .sidebar h2 {
                font-size: 18px;
                color: #ecf0f1;
                margin: 20px 0;
                display: none;
            }

            .sidebar:hover h2 {
                display: block;
                text-align: center;
                width: 100%;
                padding-bottom: 20px;
                border-bottom: 1px solid #34495e;
            }

            .sidebar a {
                width: 100%;
                text-decoration: none;
                color: #ecf0f1;
                display: flex;
                align-items: center;
                padding: 15px;
                font-size: 18px;
                transition: background 0.2s, padding-left 0.2s;
                border-radius: 30px;
                margin: 5px 0;
            }

                .sidebar a:hover {
                    background-color: #34495e;
                    padding-left: 20px;
                    cursor: pointer;
                }

            .sidebar .icon {
                font-size: 20px;
                margin-right: 15px;
            }

            .sidebar:hover h2 {
                display: block;
            }

        .auto-style1 {
            border-collapse: collapse;
            text-align: left;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-left: 104px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard">
            <div class="sidebar">
                <h2>Admin Dashboard</h2>
                <a href="Admin_dashboard.aspx" class="sidebar-item"><span class="icon">🏠</span><span>Home</span></a>
                <a href="Inventory_Management.aspx" class="sidebar-item"><span class="icon">📦</span><span>Inventory Management</span></a>
                <a href="Search_Order.aspx" class="sidebar-item"><span class="icon">📊</span><span>Reports</span></a>
                <a href="#" class="sidebar-item"><span class="icon">⚙️</span><span>Settings</span></a>
                <a href="Logout.aspx" class="sidebar-item"><span class="icon">🚪</span><span>Logout</span></a>


            </div>
            <div class="container">
                <h2>Manage Your Inventory</h2>


                <div class="inventory-panel">
                    <h3 style="color: #2c3e50; text-align: center;">Inventory Actions</h3>
                    <div class="inventory-form">
                        <label for="ddlIngredients">Select Ingredient:</label>
                        <asp:DropDownList ID="ddlIngredients" runat="server" />

                        <label for="txtQuantity">Quantity:</label>
                        <asp:TextBox ID="txtQuantity" runat="server" />

                        <asp:Button ID="btnAddInventory" runat="server" Text="Add Inventory" OnClick="btnAddInventory_Click" />
                        <asp:Button ID="btnReduceInventory" runat="server" Text="Reduce Inventory" OnClick="btnReduceInventory_Click" />
                    </div>
                </div>

                <div class="grid-container">
                    <div class="grid-title">Current Inventory</div>
                    <asp:GridView ID="gvInventory" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" Width="1348px" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="InventoryID" HeaderText="Inventory ID" />
                            <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient Name" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
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
    </form>
</body>
</html>
