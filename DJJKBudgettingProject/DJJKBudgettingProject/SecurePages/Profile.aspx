<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="Profile.aspx.cs" Inherits="DJJKBudgettingProject.SecurePages.Profile" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Profile</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Profile</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <div class="mdl-grid mdl-cell mdl-cell--12-col">
        <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Update Profile</h2>
            </div>
            <div class="mdl-card__supporting-text">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtUsername" runat="server" ReadOnly="True" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtUsername">Username</label>
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtNewPassword">New Password</label>
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtEmail">Email</label>
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtFirstName">First Name</label>
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtLastName">Last Name</label>
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtIncome" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtIncome">Yearly Income ($)</label>
                </div>

                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                    <asp:TextBox ID="txtPayFrequency" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                    <label class="mdl-textfield__label" for="ContentBody_txtPayFrequency">Pay Frequency (days)</label>
                </div>

                <div class="mdl-cell mdl-cell--12-col">
                    <asp:Label ID="lblUpdateResult" runat="server"></asp:Label>
                </div>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <asp:Button CssClass="mdl-button" ID="btnUpdate" runat="server" Text="Update Info" OnClick="btnUpdate_Click" />
            </div>
        </div>
    </div>
    <div class="mdl-grid mdl-cell mdl-cell--12-col">
        <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Delete Profile</h2>
            </div>
            <div class="mdl-card__supporting-text">
                Are you sure you want to delete your account?
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <asp:Button CssClass="mdl-button" ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Yes" />
                <asp:Button CssClass="mdl-button" ID="btnDelete" runat="server" Text="DELETE FOREVER AND EVER!" Visible="False" OnClick="btnDelete_Click" />
            </div>
            <div class="mdl-cell mdl-cell--12-col">
                    <asp:Label ID="lblDeleteResult" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
