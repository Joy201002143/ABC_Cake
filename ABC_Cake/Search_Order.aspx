<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_Order.aspx.cs" Inherits="ABC_Cake.Search_Order" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript">
        function disableOtherDropdowns(selectedDropdownId) {
            var dropdowns = document.getElementsByClassName("search-dropdown");

            for (var i = 0; i < dropdowns.length; i++) {
                if (dropdowns[i].id !== selectedDropdownId) {
                    dropdowns[i].disabled = true;
                }
            }
        }

        function enableAllDropdowns() {
            var dropdowns = document.getElementsByClassName("search-dropdown");

            for (var i = 0; i < dropdowns.length; i++) {
                dropdowns[i].disabled = false;
            }
        }
    </script>
    <style type="text/css">
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="dashboard">
                <div class="sidebar">
                    <h2>Admin Dashboard</h2>
                    <a href="Admin_dashboard.aspx" class="sidebar-item"><span class="icon">🏠</span><span>Home</span></a>
                    <a href="Inventory_Management.aspx" class="sidebar-item"><span class="icon">📦</span><span>Inventory Management</span></a>
                    <a href="Search_Order.aspx" class="sidebar-item"><span class="icon">📊</span><span>Reports</span></a>
                    <a href="#" class="sidebar-item"><span class="icon">⚙️</span><span>Settings</span></a>
                    <a href="Logout.aspx" class="sidebar-item"><span class="icon">🚪</span><span>Logout</span></a>
                </div>
                <h2 class="text-center">Search Orders</h2>
                <div class="mb-3">
                    <label for="ddlOrderId" class="form-label">Order ID</label>
                    <asp:DropDownList ID="ddlOrderId" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="ddlIngredient" class="form-label">Ingredient</label>
                    <asp:DropDownList ID="ddlIngredient" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="ddlOrderDate" class="form-label">Order Date</label>
                    <asp:DropDownList ID="ddlOrderDate" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />

                <hr />

                <asp:GridView ID="GridViewResults" runat="server" CssClass="table table-striped mt-4" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="IngredientName" HeaderText="Ingredient" />
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
    </form>
</body>
</html>
