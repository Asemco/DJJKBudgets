<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateBudget.aspx.cs" Inherits="DJJKBudgettingProject.SecurePages.CreateBudget" %>

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

                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Update Budget</asp:ListItem>
                    <asp:ListItem>Delete Budget</asp:ListItem>
                    <asp:ListItem>Create New Budget</asp:ListItem>
                </asp:DropDownList>
                <br />

     </div >    
            
     <div runat="server" id="MyDiv" >
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

            <div runat="server" id="MyDiv2" >
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
            <div runat="server" id="MyDiv3" >
        <asp:ListBox ID="ListBox3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryid"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs_Budget %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                What Would You Like To Remove<br />
        Budget Name:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
    </form>
</body>
</html>
