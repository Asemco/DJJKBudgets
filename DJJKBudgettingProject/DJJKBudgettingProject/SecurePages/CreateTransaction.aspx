﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="CreateTransaction.aspx.cs" Inherits="DJJKBudgettingProject.CreateTransaction" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Manage Transactions</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Dashboard: Manage Transactions</asp:Content>

<asp:Content ContentPlaceHolderID="ExtraHeaders" runat="server">
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
        <a href="#create" class="mdl-layout__tab is-active">Create</a>
        <a href="#update" class="mdl-layout__tab">Update</a>
        <a href="#delete" class="mdl-layout__tab">Delete</a>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div class="mdl-grid mdl-cell mdl-cell--12-col mdl-layout__tab-panel is-active" id="create">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Create Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <asp:TextBox ID="txtCreateName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                        <label class="mdl-textfield__label" for="ContentBody_txtCreateName">Name</label>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <asp:TextBox ID="txtCreateDescription" runat="server" TextMode="MultiLine" CssClass="mdl-textfield__input"></asp:TextBox>
                        <label class="mdl-textfield__label" for="ContentBody_txtCreateDescription">Description</label>
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Category:</p> <asp:ListBox ID="liBoxCreateCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" OnDataBound="liBoxCreateCategories_DataBound"></asp:ListBox>
                        <asp:SqlDataSource ID="Categories" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <asp:TextBox ID="txtCreateAmount" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                        <label class="mdl-textfield__label" for="ContentBody_txtCreateAmount">Cost ($)</label>
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Spent on date: </p><asp:Calendar ID="calendarCreateDateSpent" runat="server"></asp:Calendar>
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <asp:Label ID="lblCreateResult" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <asp:Button CssClass="mdl-button mdl-js-button mdl-js-ripple-effect" ID="btnCreate" runat="server" Text="Create Transaction" OnClick="btnCreate_Click" />
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
                    <h2 class="mdl-card__title-text">Update Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Transaction:</p>
                        <asp:ListBox ID="liBoxUpdateTransactions" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="transactionid" OnDataBound="liBoxUpdateTransactions_DataBound" OnSelectedIndexChanged="liBoxUpdateTransactions_SelectedIndexChanged"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [transactionid], RTRIM([name]) + ' - ' + [description] as [name] FROM [Transactions] WHERE ([userid] = @userid)">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <p>Transaction Name</p>
                        <asp:TextBox ID="txtUpdateName" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                        
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <p>Description</p>
                        <asp:TextBox ID="txtUpdateDescription" runat="server" TextMode="MultiLine" CssClass="mdl-textfield__input"></asp:TextBox>
                        
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Category:</p> <asp:ListBox ID="liBoxUpdateCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" OnDataBound="liBoxUpdateCategories_DataBound"></asp:ListBox>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <p>Cost($)</p>
                        <asp:TextBox ID="txtUpdateAmount" runat="server" CssClass="mdl-textfield__input"></asp:TextBox>
                        
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Spent on date:</p> <asp:Calendar ID="calendarUpdateDateSpent" runat="server"></asp:Calendar>
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <asp:Label ID="lblUpdateResult" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <asp:Button CssClass="mdl-button" ID="btnUpdate" runat="server" Text="Update Transaction" OnClick="btnUpdate_Click" />
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
                    <h2 class="mdl-card__title-text">Delete Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Transaction:</p>
                        <asp:ListBox ID="liBoxDeleteTransactions" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="transactionid" Height="49px" OnDataBound="liBoxDeleteTransactions_DataBound" OnSelectedIndexChanged="liBoxDeleteTransactions_SelectedIndexChanged"></asp:ListBox>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <p>Transaction Name</p>
                        <asp:TextBox ID="txtDeleteName" runat="server" ReadOnly="True" CssClass="mdl-textfield__input"></asp:TextBox>
                        <
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <p>Description</p>
                        <asp:TextBox ID="txtDeleteDescription" runat="server" TextMode="MultiLine" CssClass="mdl-textfield__input" ReadOnly="true"></asp:TextBox>
                        
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Category:</p>
                        <asp:ListBox ID="liBoxDeleteCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" Enabled="False"></asp:ListBox>
                    </div>

                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                        <p>Cost($)</p>
                        <asp:TextBox ID="txtDeleteAmount" runat="server" CssClass="mdl-textfield__input" ReadOnly="true"></asp:TextBox>
                    </div>
                
                    <div class="mdl-cell mdl-cell--12-col">
                        <p>Spent on date:</p>
                        <asp:Calendar ID="calendarDeleteDateSpent" runat="server" Enabled="False"></asp:Calendar>
                    </div>

                    <div class="mdl-cell mdl-cell--12-col">
                        <asp:Label ID="lblDeleteResult" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="mdl-card__actions mdl-card--border">
                    <asp:Button CssClass="mdl-button" ID="btnDelete" runat="server" Text="Delete Transaction" OnClick="btnDelete_Click" />
                </div>
            </div>
        </div>
                </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>