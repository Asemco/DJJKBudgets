<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTransaction.aspx.cs" Inherits="DJJKBudgettingProject.CreateTransaction" %>

<%@ Register src="../UserControls/HeaderUserControl.ascx" tagname="HeaderUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script>
       // $(function () {
        //$("#MyDiv").fadeOut(500);
        //$("#DropDownList1").change(function () {
          //  $("#MyDiv").fadeIn(1000);
    //});
//});
</script>
    <style>
        #MyDiv {
   float: left;
}
     #MyDiv2 {
   float: right;
}
      #MyDiv3 {
   float: center;
}

    </style>
  
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc1:HeaderUserControl ID="HeaderUserControl1" runat="server" />
            What Would You Like To Do:
            <div>

                <asp:DropDownList ID="ddlTransactionOptions" runat="server">
                    <asp:ListItem>Update Transaction</asp:ListItem>
                    <asp:ListItem>Delete Transaction</asp:ListItem>
                    <asp:ListItem>Create New Transaction</asp:ListItem>
                </asp:DropDownList>
                
                
                <br />

     </div >    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
           <ContentTemplate>
        <div runat="server" id="MyDiv" >
        
         Add A Transaction!<br />
         Name:
        <asp:TextBox ID="txtCreateName" runat="server"></asp:TextBox>
        <br />
         Description:<asp:TextBox ID="txtCreateDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
         Category:
         <asp:ListBox ID="liBoxCreateCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" OnDataBound="liBoxCreateCategories_DataBound" Width="187px"></asp:ListBox>
         <asp:SqlDataSource ID="Categories" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
         <br />
         Cost ($):<asp:TextBox ID="txtCreateAmount" runat="server"></asp:TextBox>
        <br />
         Spent on:<asp:Calendar ID="calendarCreateDateSpent" runat="server"></asp:Calendar>
             
       
    
        <br />
        <asp:Button ID="btnCreate" runat="server" Text="Create!" OnClick="btnCreate_Click" />
        <br />
        <asp:Label ID="lblCreateResult" runat="server"></asp:Label>

     </div>
               </ContentTemplate>  
           </asp:UpdatePanel>

        <div runat="server" id="MyDiv2" >
            Update A Transaction!<br />
            Transaction:
        <asp:ListBox ID="liBoxUpdateTransactions" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="transactionid" OnDataBound="liBoxUpdateTransactions_DataBound" OnSelectedIndexChanged="liBoxUpdateTransactions_SelectedIndexChanged"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT [transactionid], RTRIM([name]) + ' - ' + [description] as [name] FROM [Transactions] WHERE ([userid] = @userid)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        <br />
                Transaction Name:<asp:TextBox ID="txtUpdateName" runat="server"></asp:TextBox>
        <br />
                Description:<asp:TextBox ID="txtUpdateDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
                Category:
            <asp:ListBox ID="liBoxUpdateCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" OnDataBound="liBoxUpdateCategories_DataBound" Width="187px"></asp:ListBox>
            <br />
                Cost ($):<asp:TextBox ID="txtUpdateAmount" runat="server"></asp:TextBox>
                <br />
                Spent on: <asp:Calendar ID="calendarUpdateDateSpent" runat="server"></asp:Calendar>

       
    
                <br />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <br />
                <asp:Label ID="lblUpdateResult" runat="server"></asp:Label>

     </div>
            <div runat="server" id="MyDiv3" >
                Which Transaction Would You Like To Remove?<br />
                Transaction:
                <asp:ListBox ID="liBoxDeleteTransactions" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="transactionid" Height="49px" OnDataBound="liBoxDeleteTransactions_DataBound" OnSelectedIndexChanged="liBoxDeleteTransactions_SelectedIndexChanged"></asp:ListBox>
        <br />
                Transaction Name:<asp:TextBox ID="txtDeleteName" runat="server" ReadOnly="True"></asp:TextBox>
        <br />
                Description:<asp:TextBox ID="txtDeleteDescription" runat="server" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
        <br />
                Category:
                <asp:ListBox ID="liBoxDeleteCategories" runat="server" DataSourceID="Categories" DataTextField="categoryname" DataValueField="categoryid" Enabled="False" Width="187px"></asp:ListBox>
                <br />
                Cost ($):<asp:TextBox ID="txtDeleteAmount" runat="server" ReadOnly="True"></asp:TextBox>
                <br />
                Spent on: <asp:Calendar ID="calendarDeleteDateSpent" runat="server" Enabled="False"></asp:Calendar>

       
    
        <br />
        <asp:Button ID="btnDelete" runat="server" Text="Delete!" OnClick="btnDelete_Click" />
        <br />
        <asp:Label ID="lblDeleteResult" runat="server"></asp:Label>

     </div> 
            
    
    </div>
    </form>
</body>
</html>
