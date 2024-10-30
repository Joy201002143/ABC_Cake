<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ABC_Cake.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
</head>
    <style>
         body{
     text-align:center;
     margin-top: 10rem;
     font-size:2rem;
     padding-bottom:10px;
 }
         div{User Registration  User Name Password Contact SexMaleFemaleMaleFemale Date
             padding:5px;
         }
         .btn-login{
             margin-left:15%;

         }
         form{
             border:solid;
             margin-left:30%;
             margin-right:30%;
             padding-bottom:10px;
         }
         .checkbox{

             margin-left:15%;

         }

    </style>
   
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="User Login" ForeColor="Red"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Username "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="35px"></asp:TextBox>
        </div>
         <div>
     <asp:Label ID="Label3" runat="server" Text="Password "></asp:Label>
     <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Height="35px"></asp:TextBox>
     </div>
        <input class="checkbox" type="checkbox" onchange="document.getElementById('TextBox2').type=this.checked? 'text':'password'" /> Show Password
        <div>
            <asp:Button CssClass="btn-login" ID="Button1" runat="server" Text="Login" BackColor="#00CC00" ForeColor="White" Height="30px" Width="80px" OnClick="Button1_Click" />

           

        </div>
     
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
