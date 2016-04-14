<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="DJJKBudgettingProject.forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Forgot your password?
        <br />
        <br />
        Username:<asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
        <asp:Button ID="btnVerify" runat="server" OnClick="btnVerify_Click" Text="Verify" />
        <br />
        Secret Question:<asp:Label ID="lblQuestion" runat="server"></asp:Label>
        <br />
        Secret Answer:
        <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
        <br />
        <br />
        New Password:<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        <br />
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
