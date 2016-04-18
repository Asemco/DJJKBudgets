<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="login.aspx.cs" Inherits="DJJKBudgettingProject.login" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Login</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Login to DJJK Budgeting</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <div class="mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtUsername">Username</label>
        </div>

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtPassword">Password</label>
        </div>

        <asp:Label ID="lblResult" runat="server"></asp:Label>

        <asp:Button ID="btnLogin" CssClass="mdl-button mdl-js-button mdl-button--primary mdl-button--raised mdl-cell mdl-cell--12-col" runat="server" Text="Login" OnClick="btnLogin_Click" />

        <a href="register.aspx" class="mdl-button mdl-js-button mdl-button--raised mdl-cell mdl-cell--12-col">Register New Account</a>
    </div>
</asp:Content>