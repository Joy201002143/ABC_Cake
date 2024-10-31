<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="ABC_Cake.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 56%;
            left: 107px;
            position: relative;
            top: 14px;
            margin-left: 128px;
            margin-right: 0px;
        }
        .auto-style5 {
            width: 248px;
        }
        .auto-style7 {
            margin-left: 0px;
        }
        .auto-style8 {
            width: 257px;
        }
        </style>
</head>
<body style="height: 537px">
    <form id="form1" runat="server" style="color: #FF0000; text-align: center; background-color: #C0C0C0;">
        <div style="font-family: 'Times New Roman', Times, serif; font-size: 33px; text-decoration: blink; color: Green; text-transform: capitalize; text-align: center;">
            ABC CAKE SHOP</div>
        Order Your Custom Cake Here<br />
        <table class="auto-style1" style="font-family: 'TIMEs New Roman', Times, serif; font-size: medium; color: #0066CC; line-height: normal; vertical-align: baseline;">
            <tr>
                <td class="auto-style8" style="font-size: 25px">Select Decoration Type</td>
                <td class="auto-style5" style="font-size: 25px">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="Select Custom Cake" Value="" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" style="font-size: 25px">Select Ingredients</td>
                <td class="auto-style5" style="font-size: 25px">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="font-size: 25px">
                    <asp:Button ID="Button1" runat="server" BackColor="Lime" BorderColor="Black" CssClass="auto-style7" Height="30px" OnClick="Button1_Click" OnClientClick="True" Text="ADD" Width="80px" />
                </td>
            </tr>
            <tr>
    <td colspan="2" style="font-size: 25px">
        <asp:Label ID="LabelSelectedIngredients" runat="server" Text="" />
    </td>
</tr>
            </table>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </form>
    
</body>
</html>
