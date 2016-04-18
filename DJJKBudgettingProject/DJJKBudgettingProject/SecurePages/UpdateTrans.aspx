<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateTrans.aspx.cs" Inherits="DJJKBudgettingProject.UpdateTrans" %>

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
            Select a Budget:<asp:ListBox ID="listBoxBudgets" runat="server" DataSourceID="UserBudgets" DataTextField="name" DataValueField="budgetid" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
            </asp:ListBox>
            <asp:SqlDataSource ID="UserBudgets" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT Budget.name, Budget.budgetid FROM Budget WHERE (Budget.userid = @userid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:GridView ID="grdTrans" runat="server" CellPadding="4" EmptyDataText="You have nothing in this budget yet!" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Insert" />
    
    </div>
    </form>
</body>
</html>
