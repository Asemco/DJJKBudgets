<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DJJKBudgettingProject.SecurePages.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="float:left;width:49.99998%" runat="server">
        
        Update Profile<br />
        Username:<asp:TextBox ID="txtUsername" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
        New Password:<asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
        <br />
        E-Mail:<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        First Name:<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        Last Name:<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        Yearly
        Income:<asp:TextBox ID="txtIncome" runat="server"></asp:TextBox>
        <br />
        Pay Frequency:<asp:TextBox ID="txtPayFrequency" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update Info" OnClick="btnUpdate_Click" />
        <br />
        <asp:Label ID="lblUpdateResult" runat="server"></asp:Label>
        
    </div>
        <div style="float:left;width:49.99998%" runat="server">

            Delete Profile<br />
            Are you sure you want to delete your account?
            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" Text="Yes" />
            <br />
            <asp:Button ID="btnDelete" runat="server" Text="DELETE FOREVER AND EVER!" Visible="False" OnClick="btnDelete_Click" />
        </div>
    </form>
</body>
</html>
