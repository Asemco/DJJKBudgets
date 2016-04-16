<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBudget.aspx.cs" Inherits="DJJKBudgettingProject.SecurePages.CreateBudget" %>

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
        Select a Category:
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryid"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <br />
        Budget Name:
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <br />
        Budget Description:<asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        How much do you want to save:<asp:TextBox ID="txtSave" runat="server"></asp:TextBox>
        <br />
        Budget Start Date:<asp:Calendar ID="calendarStart" runat="server"></asp:Calendar>
        <br />
        Budget End Date:
        <asp:Calendar ID="calendarEnd" runat="server"></asp:Calendar>
        <br />
        <asp:Button ID="btnCreate" runat="server" Text="Create!" OnClick="btnCreate_Click" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
