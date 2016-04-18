<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="login.aspx.cs" Inherits="DJJKBudgettingProject.login" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Login</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Login to DJJK Budgeting</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <div class="mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--6-col mdl-grid">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="txtUsername">Username</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="txtPassword">Password</label>
        </div>

        <br />

        <asp:Label ID="lblResult" runat="server"></asp:Label>

        <br />

        <asp:Button ID="btnLogin" CssClass="mdl-button mdl-js-button mdl-button--primary mdl-button--raised" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </div>
</asp:Content>