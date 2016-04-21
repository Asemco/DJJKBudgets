<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" Inherits="DJJKBudgettingProject.SecurePages.CreateBudget" %>
<%@ Register src="../UserControls/HeaderUserControl.ascx" tagname="HeaderUserControl" tagprefix="uc1" %>
<script runat="server">
</script>


<asp:Content ContentPlaceHolderID="TitlePlaceHolder" runat="server">DJJK Budgeting - Manage Budgets</asp:Content>

<asp:Content ContentPlaceHolderID="ContentTitlePlaceHolder" runat="server">Dashboard: Manage Budgets</asp:Content>

<asp:Content ContentPlaceHolderID="ExtraHeaders" runat="server">
    <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
        <a href="#create" class="mdl-layout__tab is-active">Create</a>
        <a href="#update" class="mdl-layout__tab">Update</a>
        <a href="#delete" class="mdl-layout__tab">Delete</a>
    </div>
</asp:Content>

    


<asp:Content ContentPlaceHolderID="ContentBody" runat="server">
    <div class="mdl-layout__tab-panel is-active" id="create">
        <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Create Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">
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
            </div>
        </div>
    </div>
    <div class="mdl-layout__tab-panel" id="update">
        <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Update Budget</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryid"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    <br />
                    Transaction Name:
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                     Description:<asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    Amount:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Create!" OnClick="btnCreate_Click" />
                    <br />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <div class="mdl-layout__tab-panel" id="delete">
        <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Update Budget</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <asp:ListBox ID="ListBox3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryid"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    <br />
                    What Would You Like To Remove
                    <br />
                    Budget Name:
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    <br />
                    Budget Description:<asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Delete!" OnClick="btnCreate_Click" />
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
