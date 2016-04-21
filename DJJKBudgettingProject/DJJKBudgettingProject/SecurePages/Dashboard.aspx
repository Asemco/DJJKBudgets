<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FormsAuthenticationExample.SecurePages.Dashboard" %>

<%@ Register src="../UserControls/HeaderUserControl.ascx" tagname="HeaderUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderUserControl ID="HeaderUserControl1" runat="server" />
    </div>
        <h2>
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" />
            Welcome to My Dashboard.</h2>
        What You Are Saving For<br />
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="291px" Width="1005px">
            <Series>
                <asp:Series Name="Series1" XValueMember="name" YValueMembers="saving">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" Area3DStyle-LightStyle="Simplistic" Area3DStyle-Enable3D="True">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [name], [saving] FROM [Budget]"></asp:SqlDataSource>
        <br />
        Lets See Your Spending<br />
        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="965px">
            <Series>
                <asp:Series ChartType="FastPoint" Name="Series1" XValueMember="datespent" YValueMembers="amount" YValuesPerPoint="4">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [description], [amount], [datespent], [categoryid] FROM [Transactions]"></asp:SqlDataSource>
        <br />
        <br />
        Most Categories Cost<br />
        <br />
        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource3" Palette="Chocolate">
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
        <br />
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnCreateBudget" runat="server" OnClick="btnCreateBudget_Click" Text="Work On Budget" PostBackUrl="~/SecurePages/CreateBudget.aspx" />
        </p>
    </form>
</body>
</html>
