<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="CreateTransaction.aspx.cs" Inherits="DJJKBudgettingProject.CreateTransaction" %>

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
    <div class="mdl-layout__tab-panel is-active" id="create">
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

         Category:
         <asp:ListBox ID="liBoxCreateCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" OnDataBound="liBoxCreateCategories_DataBound" Width="187px"></asp:ListBox>
         <asp:SqlDataSource ID="Categories" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
         <br />
         Cost ($):<asp:TextBox ID="txtCreateAmount" runat="server"></asp:TextBox>
        <br />
         Spent on:<asp:Calendar ID="calendarCreateDateSpent" runat="server"></asp:Calendar>

       
    
        <br />
        <asp:Button ID="btnCreate" runat="server" Text="Create!" OnClick="btnCreate_Click" />
        <br />
        <asp:Label ID="lblCreateResult" runat="server"></asp:Label>

                </div>
            </div>
        </div>
    </div>
    <div class="mdl-layout__tab-panel" id="update">
        <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Update Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">

                    Transaction:
        <asp:ListBox ID="liBoxUpdateTransactions" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="transactionid" OnDataBound="liBoxUpdateTransactions_DataBound" OnSelectedIndexChanged="liBoxUpdateTransactions_SelectedIndexChanged"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [transactionid], RTRIM([name]) + ' - ' + [description] as [name] FROM [Transactions] WHERE ([userid] = @userid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        <br />
                Transaction Name:<asp:TextBox ID="txtUpdateName" runat="server"></asp:TextBox>
        <br />
                Description:<asp:TextBox ID="txtUpdateDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
                Category:
            <asp:ListBox ID="liBoxUpdateCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" OnDataBound="liBoxCreateCategories_DataBound" Width="187px"></asp:ListBox>
            <br />
                Cost ($):<asp:TextBox ID="txtUpdateAmount" runat="server"></asp:TextBox>
                <br />
                Spent on: <asp:Calendar ID="calendarUpdateDateSpent" runat="server"></asp:Calendar>

       
    
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <br />
                <asp:Label ID="lblUpdateResult" runat="server"></asp:Label>

                </div>
            </div>
        </div>
    </div>
    <div class="mdl-layout__tab-panel" id="delete">
        <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Delete Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">

                    Transaction:
                <asp:ListBox ID="liBoxDeleteTransactions" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="transactionid" Height="49px" OnDataBound="liBoxUpdateTransactions_DataBound" OnSelectedIndexChanged="liBoxDeleteTransactions_SelectedIndexChanged"></asp:ListBox>
        <br />
                Transaction Name:<asp:TextBox ID="txtDeleteName" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
                Description:<asp:TextBox ID="txtDeleteDescription" runat="server" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
        <br />
                Category:
                <asp:ListBox ID="liBoxDeleteCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" Enabled="False" Width="187px"></asp:ListBox>
                <br />
                Cost ($):<asp:TextBox ID="txtDeleteAmount" runat="server" ReadOnly="True"></asp:TextBox>
                <br />
                Spent on: <asp:Calendar ID="calendarDeleteDateSpent" runat="server" Enabled="False"></asp:Calendar>

       
    
        <br />
        <asp:Button ID="btnDelete" runat="server" Text="Delete!" OnClick="btnDelete_Click" />
        <br />
        <asp:Label ID="lblDeleteResult" runat="server"></asp:Label>

                </div>
            </div>
        </div>
    </div>
</asp:Content>