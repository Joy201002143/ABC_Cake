<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search_Order.aspx.cs" Inherits="ABC_Cake.Search_Order" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#ddlOrderIDs").hide();
            $("#txtOrderSearch").on("click", function () {
                $("#ddlOrderIDs").show();
            });


            $("#txtOrderSearch").on("input", function () {
                $("#ddlOrderIDs").show();
                var query = $(this).val().toLowerCase();
                var options = $("#ddlOrderIDs option").toArray();

                options.sort(function (a, b) {
                    var aText = $(a).text().toLowerCase();
                    var bText = $(b).text().toLowerCase();

                    var aMatch = aText.indexOf(query) > -1 ? 0 : 1;
                    var bMatch = bText.indexOf(query) > -1 ? 0 : 1;

                    return aMatch - bMatch || aText.localeCompare(bText);
                });

                $("#ddlOrderIDs").empty().append(options);

                $("#ddlOrderIDs option").each(function () {
                    $(this).toggle($(this).text().toLowerCase().includes(query));
                });
            });

            $("#ddlOrderIDs").on("change", function () {
                var selectedText = $(this).find("option:selected").text();
                $("#txtOrderSearch").val(selectedText);
                $("#ddlOrderIDs").hide();
                $(this).val(enteredText);

            });

            $("#txtOrderSearch").on("keypress", function (e) {
                if (e.which == 13) {
                    e.preventDefault();
                    var enteredText = $(this).val();
                    if (enteredText) {
                        $(this).val(enteredText);
                    }
                    $("#ddlOrderIDs").hide();
                }
            });


            $(document).click(function (e) {
                if (!$(e.target).closest("#ddlOrderContainer").length) {
                    $("#ddlOrderIDs").hide();
                }
            });
        });
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

        #ddlOrderContainer {
            position: relative;
            width: 300px;
            margin-top: 20px;
        }

        #txtOrderSearch {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
        }

        #ddlOrderIDs {
            width: 100%;
            max-height: 150px;
            overflow-y: auto;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-top: none;
            position: absolute;
            background-color: white;
            z-index: 1;
            display: none;
        }

            #ddlOrderIDs option {
                padding: 8px;
                cursor: pointer;
            }

                #ddlOrderIDs option:hover {
                    background-color: #f1f1f1;
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
                <div id="ddlOrderContainer" ckass="mb-3">

                                        <asp:Label ID="Label1" runat="server" Text="Type Order ID"></asp:Label>

                    <asp:TextBox ID="txtOrderSearch" runat="server" ReadOnly="false" CssClass="input-field read-only"></asp:TextBox>


                    <asp:DropDownList ID="ddlOrderIDs" runat="server" AutoPostBack="false" size="10" Style="display: block;">
                    </asp:DropDownList>
                </div>
                
                

                <div class="mb-3">
                    <label for="ddlIngredient" class="form-label">Ingredient</label>
                    <asp:DropDownList ID="ddlIngredient" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label for="txtStartDate" class="form-label">Start Date</label>
                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label for="txtEndDate" class="form-label">End Date</label>
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>

                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />

                <hr />

                <asp:GridView ID="GridViewResults" runat="server" CssClass="table table-striped mt-4" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" />
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" />
                        <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient" />
                        <asp:BoundField DataField="status_name" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    
</body>
</html>
