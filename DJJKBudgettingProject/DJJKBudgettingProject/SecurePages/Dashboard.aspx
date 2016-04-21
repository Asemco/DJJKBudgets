<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" CodeBehind="Dashboard.aspx.cs" Inherits="FormsAuthenticationExample.SecurePages.Dashboard" %>

<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Overview</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Dashboard: Overview</asp:Content>

<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <div class="mdl-grid mdl-cell mdl-cell--12-col">
        <div class="mdl-cell mdl-cell--6-col mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Savings</h2>
            </div>
            <div class="mdl-card__supporting-text mdl-typography--text-center">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="name" YValueMembers="saving">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [userid], [name], [saving] FROM [Budget]"></asp:SqlDataSource>
            </div>
        </div>

        <div class="mdl-cell mdl-cell--6-col mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Spending</h2>
            </div>
            <div class="mdl-card__supporting-text mdl-typography--text-center">
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                    <Series>
                        <asp:Series ChartType="Point" Name="Series1" XValueMember="datespent" YValueMembers="amount">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [description], [amount], [datespent], [categoryid] FROM [Transactions]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="mdl-grid mdl-cell mdl-cell--12-col">
        <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Categories</h2>
            </div>
            <div class="mdl-card__supporting-text mdl-typography--text-center">
                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3">
                    <Series>
                        <asp:Series ChartType="Pyramid" Name="Series1" XValueMember="categoryname" YValueMembers="categoryid">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [categoryid], [categoryname] FROM [Category]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="mdl-grid mdl-cell mdl-cell--12-col">
        <asp:Button CssClass="mdl-cell mdl-cell--12-col mdl-button mdl-button--raised mdl-button--primary" ID="btnCreateBudget" runat="server" OnClick="btnCreateBudget_Click" Text="Work On Budget" PostBackUrl="~/SecurePages/CreateBudget.aspx" />
    </div>
</asp:Content>
