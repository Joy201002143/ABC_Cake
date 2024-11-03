<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_dashboard.aspx.cs" Inherits="ABC_Cake.Admin_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .dashboard {
            width: 80%;
            margin: auto;
            display: flex;
        }

        .panels {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
            flex: 1;
        }

        .panel {
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            flex: 1;
            margin: 10px;
            transition: transform 0.2s;
            text-align: center; 
            
        }

        /* Colorful backgrounds */
        #totalUsersPanel {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
        }

        #totalSalesPanel {
            background: linear-gradient(135deg, #ff758c 0%, #ff7eb3 100%);
        }

        #totalInventoryPanel {
            background: linear-gradient(135deg, #ffec61 0%, #f8ffae 100%);
        }

        #lowInventoryPanel {
            background: linear-gradient(135deg, #ff9966 0%, #ff5e62 100%);
        }

        .panel:hover {
            transform: scale(1.05); /* Scale up on hover */
        }

        .sidebar {
            width: 20%;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
        }

        .sidebar h2 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .sidebar button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .sidebar button:hover {
            background-color: #0056b3;
        }

        /* Large text for panel headings and content */
        .panel h2 {
            font-size: 24px; /* Increase font size for headings */
            margin: 0;
            color: #333; /* Dark color for better visibility */
        }

        .panel p {
            font-size: 40px; /* Increase font size for content */
            margin: 10px 0 0; /* Margin adjustments for spacing */
            color: #666; /* Lighter color for content */
        }
        .auto-style1 {
            margin-left: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard">
            <div class="sidebar">
                <h2>Admin Actions</h2>
                <button type="button" onclick="location.href='AddIngredient.aspx'">Add Ingredient</button>
                <button type="button" onclick="location.href='ViewReports.aspx'">View Reports</button>
                <button type="button" onclick="location.href='UserManagement.aspx'">User Management</button>
                <button type="button" onclick="location.href='Logout.aspx'">Logout</button>
            </div>

            <div>
                <h1>Admin Dashboard</h1>
                <div class="panels">
                    <div class="panel" id="totalUsersPanel">
                        <h2>Total Users</h2>
                        <p id="totalUsersLabel" runat="server"></p>
                    </div>
                    <div class="panel" id="totalSalesPanel">
                        <h2>Total Sales</h2>
                        <p id="totalSalesLabel" runat="server"></p>
                    </div>
                    <div class="panel" id="totalInventoryPanel">
                        <h2>Total Inventory in Stock</h2>
                        <p id="totalInventoryLabel" runat="server"></p>
                    </div>
                    <div class="panel" id="lowInventoryPanel">
                        <h2>Low Inventory List</h2>
                        <asp:GridView ID="LowInventoryGrid" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient Name" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <h2>Order List</h2>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlStatusFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterOrdersByStatus">
                    <asp:ListItem Text="All" Value="All"></asp:ListItem>
                    <asp:ListItem Text="Pending" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Confirmed" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Processing" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Shipped" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Delivered" Value="5"></asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <asp:GridView ID="OrderGrid" runat="server" AutoGenerateColumns="False" Width="1022px" CssClass="auto-style1">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="UserId" HeaderText="User ID" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="StatusID" HeaderText="Status ID" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy hh:mm tt}" />
                        <asp:BoundField DataField="DeliveryAddress" HeaderText="Delivery Address" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        <asp:TemplateField HeaderText="Change Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlOrderStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="UpdateOrderStatus">
                                    <asp:ListItem Text="Pending" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Confirmed" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Processing" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Shipped" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Delivered" Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>

