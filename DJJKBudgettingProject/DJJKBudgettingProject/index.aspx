<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DJJKBudgettingProject.index" %>

<%@ Register src="UserControls/HeaderUserControl.ascx" tagname="HeaderUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

    </style>
</head>
<body style="background-color: #EEEEFF">
    <form id="form1" runat="server">
    <div>
        <header class="newStyle3">
            <uc1:HeaderUserControl ID="HeaderUserControl1" runat="server" />
        </header>
        <p>
            Welcome to DJKJ Budgeting.</p>
    
    </div>
    </form>
</body>
</html>
