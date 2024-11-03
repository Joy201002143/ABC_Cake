<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_dashboard.aspx.cs" Inherits="ABC_Cake.Admin_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            display: flex;
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

        /* Sidebar Button Styling */
        .sidebar a {
            width: 100%;
            text-decoration: none;
            color: #ecf0f1;
            display: flex;
            align-items: center;
            padding: 15px;
            font-size: 18px;
            transition: background 0.2s, padding-left 0.2s;
            border-radius: 30px; /* Rounded button style */
            margin: 5px 0;
        }

        .sidebar a:hover {
            background-color: #34495e;
            padding-left: 20px; /* Indent on hover for effect */
            cursor: pointer;
        }

        .sidebar .icon {
            font-size: 20px;
            margin-right: 15px;
        }

        .sidebar:hover h2 {
            display: block;
        }

        /* Dashboard Styling */
        .dashboard {
            margin-left: 60px;
            padding: 20px;
            width: calc(100% - 60px);
            transition: margin-left 0.3s ease, width 0.3s ease;
        }

        .sidebar:hover ~ .dashboard {
            margin-left: 250px;
            width: calc(100% - 250px);
        }

        .dashboard .panels {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-top: 20px;
        }

        .panel {
            flex: 1;
            min-width: 250px;
            margin: 10px;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s;
        }

        .panel:hover {
            transform: scale(1.05);
        }

        /* Panel Colors */
        #totalUsersPanel {
            background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
        }

        #totalSalesPanel {
            background: linear-gradient(135deg, #ff758c 0%, #ff7eb3 100%);
        }

        #totalInventoryPanel {
            background: linear-gradient(135deg, #ccbc4d 100%, #f8ffae 100%);
        }

        #lowInventoryPanel {
            background: linear-gradient(135deg, #ff9966 0%, #ff5e62 100%);
        }

        /* Text Styling */
        .panel h2 {
            font-size: 30px;
            margin: 0;
            color: #fff;
        }

        .panel p {
            font-size: 55px;
            margin: 10px 0 0;
            color: #fff;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard">
            <div class="sidebar">
        <h2>Admin Dashboard</h2>
        <a href="#" class="sidebar-item"><span class="icon">🏠</span><span>Home</span></a>
        <a href="Inventory_Management.aspx" class="sidebar-item"><span class="icon">📦</span><span>Inventory Management</span></a>
        <a href="#" class="sidebar-item"><span class="icon">📊</span><span>Reports</span></a>
        <a href="#" class="sidebar-item"><span class="icon">⚙️</span><span>Settings</span></a>
        <a href="Logout.aspx" class="sidebar-item"><span class="icon">🚪</span><span>Logout</span></a>


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
                        <br />
                        <asp:GridView ID="LowInventoryGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="145px" Width="303px">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient Name" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </div>
                </div>

                <h2>Order List</h2>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="UpdateOrderStatus">

</asp:DropDownList>

                <br />
                <br />
                <asp:GridView ID="OrderGrid" runat="server" AutoGenerateColumns="False" Width="1342px" CssClass="auto-style1" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-left: 65px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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

