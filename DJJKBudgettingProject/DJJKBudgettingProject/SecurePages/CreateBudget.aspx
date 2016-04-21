<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/material.Master" Inherits="DJJKBudgettingProject.SecurePages.CreateBudget" %>
<%@ Register src="../UserControls/HeaderUserControl.ascx" tagname="HeaderUserControl" tagprefix="uc1" %>


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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="mdl-layout__tab-panel is-active" id="create">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Create Transaction</h2>
                </div>
                <div class="mdl-card__supporting-text">

                    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryid"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [budgetid], [name] FROM [Budget] WHERE ([userid] = @userid)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="usersid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="mdl-layout__tab-panel" id="update">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Update Budget</h2>
                </div>
                <div class="mdl-card__supporting-text">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Budget] WHERE ([userid] = @userid)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    Transaction Name:
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />
                     Description:<asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                    <br />
                    Amount:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:Button ID="updateBtn" runat="server" Text="Update!" OnClick="btnUpdate_Click" />
                    <br />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </div>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="mdl-layout__tab-panel" id="delete">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="mdl-grid mdl-cell mdl-cell--12-col">
            <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">Update Budget</h2>
                </div>
                <div class="mdl-card__supporting-text mdl-cell--12-col">
                    <asp:DropDownList ID="DropDownList1" DataSourceID="DataSourceBudgetList" DataTextField="name" DataValueField="budgetid" runat="server" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="DataSourceBudgetList" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Budget] WHERE ([userid] = @userid)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" Text="Delete!" OnClick="btnDelete_Click" />
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
            </div>
        </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
