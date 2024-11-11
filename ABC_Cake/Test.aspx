<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="ABC_Cake.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order ID Autocomplete Dropdown</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
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
</head>
<body>
    <form id="form1" runat="server">
        <center>
             <label >Enter Order ID For Search</label>
        <div id="ddlOrderContainer">
           
        
            <asp:TextBox ID="txtOrderSearch" runat="server" ReadOnly="false" CssClass="input-field read-only" ></asp:TextBox>


            <asp:DropDownList ID="ddlOrderIDs" runat="server" AutoPostBack="false   " size="10"     style="display: block;">
                
            </asp:DropDownList>
        </div>
            </center>
    </form>
</body>
</html>
