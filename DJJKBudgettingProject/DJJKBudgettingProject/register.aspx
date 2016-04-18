<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="register.aspx.cs" Inherits="DJJKBudgettingProject.register" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Register</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Register a new account</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <div class="mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtFirstName">First Name</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtLastName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtLastName">Last Name</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtUsername">Username</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtPassword">Password</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtPasswordVerify" TextMode="Password" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtPasswordVerify">Confirm Password</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtEmail">Email</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtQuestion">Secret Question</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtAnswer" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtAnswer">Secret Answer</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtIncome" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtIncome">Income</label>
        </div>

        <br />

        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <asp:TextBox ID="txtFrequency" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
            <label class="mdl-textfield__label" for="ContentBody_txtFrequency">Pay Frequency (days)</label>
        </div>

        <br />

        <asp:Button ID="btnVerify" CssClass="mdl-button mdl-js-button mdl-button--raised" runat="server" OnClick="btnVerify_Click" Text="Verify Username" />
        &nbsp;
        <asp:Button ID="btnRegister" CssClass="mdl-button mdl-js-button mdl-button--primary mdl-button--raised" runat="server" OnClick="btnRegister_Click" Text="Register" />

        <br />
        
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </div>
</asp:Content>
