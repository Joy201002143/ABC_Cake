<%@ Page Title="Contact Page    " Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ABC_Cake.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Contact With Joy.</h3>
        <address>
            The system made by Joy Munshi<br /> 
            777/2, west kazipara, Mirpur, Dhaka<br />
            <abbr title="Phone">P:</abbr>

            01630465310
        </address>
 
        <address>
            <strong>Personal Mail:</strong>   <a href="mailto:joymunshi46@gmail.com">joymunshi46@gmail.com</a><br />
            <strong>Proffesional Mail:</strong> <a href="mailto:joy.201002143@green.ac.bd">joy.201002143@green.ac.bd</a>
        </address>
    </main>
</asp:Content>
