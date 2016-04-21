﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" Inherits="DJJKBudgettingProject.SecurePages.CreateBudget" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Manage Budgets</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Dashboard: Manage Budgets</asp:Content>

<asp:Content ContentPlaceHolderID="ExtraHeaders" runat="server">
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
        <a href="#create" class="mdl-layout__tab is-active">Create</a>
        <a href="#update" class="mdl-layout__tab">Update</a>
        <a href="#delete" class="mdl-layout__tab">Delete</a>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="mdl-grid mdl-cell mdl-cell--12-col mdl-layout__tab-panel is-active" id="create">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="mdl-grid mdl-cell mdl-cell--12-col">
                    <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Create Budget</h2>
                        </div>
                        <div class="mdl-card__supporting-text">
                            <div class="mdl-cell mdl-cell--12-col">
                                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryid"></asp:ListBox>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [budgetid], [name] FROM [Budget] WHERE ([userid] = @userid)">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="usersid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                                <asp:TextBox ID="txtName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                                <label class="mdl-textfield__label" for="ContentBody_txtName">Budget Name</label>
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="mdl-textfield__input"></asp:TextBox>
                                <label class="mdl-textfield__label" for="ContentBody_txtDescription">Budget Description</label>
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                                <asp:TextBox ID="txtSave" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                                <label class="mdl-textfield__label" for="ContentBody_txtSave">How much you want to save ($)</label>
                            </div>

                            <div class="mdl-cell mdl-cell--12-col">
                                Budget Start Date: <asp:Calendar ID="calendarStart" runat="server"></asp:Calendar>
                            </div>

                            <div class="mdl-cell mdl-cell--12-col">
                                Budget End Date: 
                                <asp:Calendar ID="calendarEnd" runat="server"></asp:Calendar>
                            </div>

                            <div class="mdl-cell mdl-cell--12-col">
                                <asp:Label ID="lblResult" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="mdl-card__actions mdl-card--border">
                            <asp:Button CssClass="mdl-button" ID="btnCreate" runat="server" Text="Create!" OnClick="btnCreate_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="mdl-grid mdl-cell mdl-cell--12-col mdl-layout__tab-panel" id="update">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="mdl-grid mdl-cell mdl-cell--12-col">
                    <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Update Budget</h2>
                        </div>
                        <div class="mdl-card__supporting-text">
                            <div class="mdl-cell mdl-cell--12-col">
                                <!-- select box -->

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Budget] WHERE ([userid] = @userid)">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                                <label class="mdl-textfield__label" for="ContentBody_TextBox1">Transaction Name</label>
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                                <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" CssClass="mdl-textfield__input"></asp:TextBox>
                                <label class="mdl-textfield__label" for="ContentBody_TextBox3">Description</label>
                            </div>

                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                                <asp:TextBox ID="TextBox4" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                                <label class="mdl-textfield__label" for="ContentBody_TextBox4">Amount</label>
                            </div>

                            <div class="mdl-cell mdl-cell--12-col">
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="mdl-card__actions mdl-card--border">
                            <asp:Button CssClass="mdl-button" ID="updateBtn" runat="server" Text="Update!" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="mdl-grid mdl-cell mdl-cell--12-col mdl-layout__tab-panel" id="delete">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="mdl-grid mdl-cell mdl-cell--12-col">
                    <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                        <div class="mdl-card__title">
                            <h2 class="mdl-card__title-text">Delete Budget</h2>
                        </div>
                        <div class="mdl-card__supporting-text mdl-cell--12-col">
                            <div class="mdl-cell mdl-cell--12-col">
                                <asp:DropDownList ID="DropDownList1" DataSourceID="DataSourceBudgetList" DataTextField="name" DataValueField="budgetid" runat="server" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource ID="DataSourceBudgetList" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Budget] WHERE ([userid] = @userid)">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="mdl-cell mdl-cell--12-col">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="mdl-card__actions mdl-card--border">
                            <asp:Button CssClass="mdl-button" ID="Button1" runat="server" Text="Delete!" OnClick="btnDelete_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
