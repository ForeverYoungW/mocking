<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manager.aspx.cs" Inherits="manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="Type" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" DeleteCommand="DELETE FROM [classes] WHERE [articleClass] = @original_articleClass" InsertCommand="INSERT INTO [classes] ([articleClass]) VALUES (@articleClass)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [classes] ORDER BY [articleClass]">
            <DeleteParameters>
                <asp:Parameter Name="original_articleClass" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="articleClass" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
        <br />
        删除分类及所属文章<br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Type" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="articleClass" HeaderText="文章分类" SortExpression="articleClass" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        添加文章分类<br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="articleClass" DataSourceID="Type" DefaultMode="Insert">
            <EditItemTemplate>
                articleClass:
                <asp:Label ID="articleClassLabel1" runat="server" Text='<%# Eval("articleClass") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                分类名称:
                <asp:TextBox ID="articleClassTextBox" runat="server" Text='<%# Bind("articleClass") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                articleClass:
                <asp:Label ID="articleClassLabel" runat="server" Text='<%# Eval("articleClass") %>' />
                <br />
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="Article" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" DeleteCommand="DELETE FROM [articles] WHERE [articleID] = @original_articleID AND [userID] = @original_userID AND [articleTitle] = @original_articleTitle AND [pushTime] = @original_pushTime AND [articleClass] = @original_articleClass" InsertCommand="INSERT INTO [articles] ([userID], [articleTitle], [pushTime], [articleClass]) VALUES (@userID, @articleTitle, @pushTime, @articleClass)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [userID], [articleID], [articleTitle], [pushTime], [articleClass] FROM [articles] ORDER BY [articleID]" UpdateCommand="UPDATE [articles] SET [userID] = @userID, [articleTitle] = @articleTitle, [pushTime] = @pushTime, [articleClass] = @articleClass WHERE [articleID] = @original_articleID AND [userID] = @original_userID AND [articleTitle] = @original_articleTitle AND [pushTime] = @original_pushTime AND [articleClass] = @original_articleClass">
            <DeleteParameters>
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter DbType="Date" Name="original_pushTime" />
                <asp:Parameter Name="original_articleClass" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter DbType="Date" Name="pushTime" />
                <asp:Parameter Name="articleClass" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter DbType="Date" Name="pushTime" />
                <asp:Parameter Name="articleClass" Type="String" />
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter DbType="Date" Name="original_pushTime" />
                <asp:Parameter Name="original_articleClass" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        删除不良文章<br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Article" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" />
                <asp:BoundField DataField="articleID" HeaderText="articleID" InsertVisible="False" ReadOnly="True" SortExpression="articleID" />
                <asp:BoundField DataField="articleTitle" HeaderText="articleTitle" SortExpression="articleTitle" />
                <asp:BoundField DataField="pushTime" HeaderText="pushTime" SortExpression="pushTime" />
                <asp:BoundField DataField="articleClass" HeaderText="articleClass" SortExpression="articleClass" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回首页" />
    </form>
    </body>
</html>
