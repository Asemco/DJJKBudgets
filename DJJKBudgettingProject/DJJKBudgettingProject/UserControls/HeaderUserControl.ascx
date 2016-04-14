<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderUserControl.ascx.cs" Inherits="FormsAuthenticationExample.UserControls.HeaderUserControl" %>
<div style="text-align:center">
<h1>DJJK Budgeting</h1>

<asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" Orientation="Horizontal" StaticSubMenuIndent="10px" BorderStyle="None" style="text-align: center">
    <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <DynamicMenuStyle BackColor="#E3EAEB" />
    <DynamicSelectedStyle BackColor="#1C5E55" />
    <Items>
        <asp:MenuItem NavigateUrl="~/index.aspx" Text="Home" Value="Home"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/Register.aspx" Text="Register" Value="Register"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/Login.aspx" Text="Login" Value="Login"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/SecurePages/Dashboard.aspx" Text="My Dashboard" Value="My Dashboard"></asp:MenuItem>
    </Items>
    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticMenuStyle HorizontalPadding="0px" />
    <StaticSelectedStyle BackColor="#1C5E55" />
</asp:Menu>
</div>

<hr />