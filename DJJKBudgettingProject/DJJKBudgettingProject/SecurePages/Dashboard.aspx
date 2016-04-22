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
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Palette="SeaGreen">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="name" YValueMembers="saving" MarkerStyle="Diamond">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Interval="2"> </AxisX>
                            <AxisY Interval="1000"> </AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [name], [saving] FROM [Budget] WHERE ([userid] = @userid)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

        <div class="mdl-cell mdl-cell--6-col mdl-card mdl-shadow--2dp">
            <div class="mdl-card__title">
                <h2 class="mdl-card__title-text">Spending</h2>
            </div>
            <div class="mdl-card__supporting-text mdl-typography--text-center">
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Palette="Berry">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="name" YValueMembers="Amount" YValuesPerPoint="2" MarkerStyle="Diamond">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Interval="1"> </AxisX>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT Budget.name, SUM(Transactions.amount) AS Amount FROM Budget INNER JOIN BudgetCategories ON Budget.budgetid = BudgetCategories.budgetid INNER JOIN Transactions ON BudgetCategories.categoryid = Transactions.categoryid INNER JOIN Users ON Budget.userid = Users.userid AND Transactions.userid = Users.userid WHERE (Users.userid = @userid) GROUP BY Budget.name ORDER BY Budget.name">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
                        <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="categoryname" YValueMembers="amount" YValuesPerPoint="6">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" BackGradientStyle="None">
                            <AxisX Interval="1" LabelAutoFitStyle="IncreaseFont, DecreaseFont, StaggeredLabels, LabelsAngleStep45, WordWrap"> </AxisX>
                            <AxisY Enabled="True"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT Category.categoryname, SUM(Transactions.amount) AS amount FROM Category INNER JOIN Transactions ON Category.categoryid = Transactions.categoryid INNER JOIN Users ON Users.userid = Transactions.userid WHERE (Users.userid = @userid) GROUP BY Category.categoryid, Category.categoryname ORDER BY Category.categoryid">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <div class="mdl-grid mdl-cell mdl-cell--12-col">
        <asp:Button CssClass="mdl-cell mdl-cell--12-col mdl-button mdl-button--raised mdl-button--primary" ID="btnCreateBudget" runat="server" OnClick="btnCreateBudget_Click" Text="Work On Budget" PostBackUrl="~/SecurePages/CreateBudget.aspx" />
    </div>
</asp:Content>
