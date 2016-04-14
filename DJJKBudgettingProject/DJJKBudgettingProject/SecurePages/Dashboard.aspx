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
            <asp:Button ID="btnCreateBudget" runat="server" OnClick="btnCreateBudget_Click" Text="Create a Budget" />
            Select a Budget:<asp:ListBox ID="ListBox1" runat="server" DataSourceID="UserBudgets" DataTextField="name" DataValueField="budgetid"></asp:ListBox>
            <asp:SqlDataSource ID="UserBudgets" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT Users.username, Budget.name, Budget.budgetid FROM Budget INNER JOIN Users ON Budget.userid = Users.userid WHERE (Users.username = @username)">
                <SelectParameters>
                    <asp:FormParameter DefaultValue="null" FormField="username" Name="username" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
