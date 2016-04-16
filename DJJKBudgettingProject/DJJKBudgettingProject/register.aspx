<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DJJKBudgettingProject.register" %>

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
    
        First Name:<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        Last Name:<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        Username:<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:Button ID="btnVerify" runat="server" OnClick="btnVerify_Click" Text="Verify" />
        <br />
        Password:<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
        <br />
        Verify Password:<asp:TextBox ID="txtPasswordVerify" runat="server"></asp:TextBox>
        <br />
        Email:<asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
        <br />
        Secret Question:<asp:TextBox ID="txtQuestion" runat="server"></asp:TextBox>
        <br />
        Secret Answer:<asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
        <br />
        Income:<asp:TextBox ID="txtIncome" runat="server"></asp:TextBox>
        <br />
        How often do you get paid, in days (ex: 7, 14, 30):<asp:TextBox ID="txtFrequency" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
