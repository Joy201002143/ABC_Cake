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

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            padding: 30px;
            margin: 20px auto;
            max-width: 600px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            }

        .card-header {
            font-size: 1.5rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
            border-bottom: 2px solid #f1f1f1;
        }

        .form-label {
            font-size: 1rem;
            font-weight: 500;
            margin-bottom: 5px;
            color: #495057;
            text-align: center;
        }

        .form-control, .form-select {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 10px;
            font-size: 1rem;
            width: 100%;
            transition: border-color 0.3s ease;
            max-width: 100%;
        }

        .form-control, .form-select {
            margin-bottom: 15px;
        }

            .form-control:focus, .form-select:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
            }

        /* Button Styling */
        .btn {
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            color: #fff;
        }

            .btn-primary:hover {
                background-color: #0056b3;
                cursor: pointer;
            }

        /* Center Alignment */
        .text-center {
            text-align: center;
        }

        /* Spacing Between Inputs */
        .mb-3 {
            margin-bottom: 1.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .card {
                padding: 20px;
                max-width: 90%;
            }

            .form-label {
                font-size: 0.9rem;
            }

            .form-control, .form-select {
                font-size: 0.9rem;
            }

            .btn {
                font-size: 1rem;
            }
        }

        /* Center alignment for row and form elements */
        .row {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .col-md-4 {
            display: flex;
            justify-content: center;
            flex-direction: column;
            width: 100%;
            max-width: 200px;
        }

        /* Align labels and fields in the center */
        .mb-3 {
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        /* Ensuring proper spacing between each column */
        .col-md-4 {
            margin-bottom: 20px;
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
                <div class="card">
                    <div class="card-body">

                        <div class="row mb-4">

                            <div class="col-md-4">

                                <div id="ddlOrderContainer" class="col-md-4">
                                 <center>

                                        <asp:Label ID="Label1" runat="server" Text="Type Order ID" Font-Bold="True"></asp:Label>
                                            <br />
                                        <asp:TextBox ID="txtOrderSearch" runat="server" ReadOnly="false" CssClass="input-field"></asp:TextBox>


                                        <asp:DropDownList ID="ddlOrderIDs" runat="server" AutoPostBack="false" size="5" Style="display: block;">
                                        </asp:DropDownList>
                                    </center>
                                </div>
                            </div>


                            <div class="row mb-3">

                                <div class="col-md-4">
                                    <label for="ddlIngredient" class="form-label">Ingredient</label>
                                    <asp:DropDownList ID="ddlIngredient" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>

                                <div class="col-md-4">
                                    <label for="ddlIngredient" class="form-label">Status</label>
                                    <asp:DropDownList ID="status" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4 text-center">
                            <label for="txtStartDate" class="form-label">Start Date</label>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="col-md-4 text-center">
                            <label for="txtEndDate" class="form-label">End Date</label>
                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>


                        <center>
                            <hr />
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />


                        </center>
                    </div>
                </div>
            </div>
            <asp:GridView ID="GridViewResults" runat="server" CssClass="table table-striped mt-4" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" DataFormatString="{0:C}" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="Ingredient_Name" HeaderText="Ingredient" />
                    <asp:BoundField DataField="status_name" HeaderText="Status" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>

        </div>



    </form>


</body>
</html>
