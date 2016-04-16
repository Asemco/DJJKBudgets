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
        <p>
            <asp:Button ID="btnCreateBudget" runat="server" OnClick="btnCreateBudget_Click" Text="Create a Budget" PostBackUrl="~/SecurePages/CreateBudget.aspx" />
            Select a Budget:<asp:ListBox ID="listBoxBudgets" runat="server" DataSourceID="UserBudgets" DataTextField="name" DataValueField="budgetid" AutoPostBack="True">
                <asp:ListItem Value="-1">Select a Budget</asp:ListItem>
            </asp:ListBox>
            <asp:SqlDataSource ID="UserBudgets" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT Budget.name, Budget.budgetid FROM Budget WHERE (Budget.userid = @userid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
