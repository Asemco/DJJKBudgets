<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DJJKBudgettingProject.login" %>

<%@ Register src="UserControls/HeaderUserControl.ascx" tagname="HeaderUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:HeaderUserControl ID="HeaderUserControl1" runat="server" />
    
        Username:<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
        <br />
        <br />
        Password:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
    
        <br />
    
    </div>
    </form>
</body>
</html>
