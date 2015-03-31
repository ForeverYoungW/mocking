<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myBlog.aspx.cs" Inherits="myBlog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img alt="" src="<%=srcc%>" style="height: 155px; width: 133px" /><asp:Label ID="userID" runat="server" Text="用户名"></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/newArticle.aspx">写新博客</asp:HyperLink>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" DeleteCommand="DELETE FROM [articles] WHERE [articleID] = @original_articleID AND [articleTitle] = @original_articleTitle AND [articleClass] = @original_articleClass AND [pushTime] = @original_pushTime AND [clockCount] = @original_clockCount" InsertCommand="INSERT INTO [articles] ([articleTitle], [articleClass], [pushTime], [clockCount]) VALUES (@articleTitle, @articleClass, @pushTime, @clockCount)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [articleTitle], [articleClass], [articleID], [pushTime], [clockCount] FROM [articles]" UpdateCommand="UPDATE [articles] SET [articleTitle] = @articleTitle, [articleClass] = @articleClass, [pushTime] = @pushTime, [clockCount] = @clockCount WHERE [articleID] = @original_articleID AND [articleTitle] = @original_articleTitle AND [articleClass] = @original_articleClass AND [pushTime] = @original_pushTime AND [clockCount] = @original_clockCount">
            <DeleteParameters>
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter Name="original_articleClass" Type="String" />
                <asp:Parameter DbType="Date" Name="original_pushTime" />
                <asp:Parameter Name="original_clockCount" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter Name="articleClass" Type="String" />
                <asp:Parameter DbType="Date" Name="pushTime" />
                <asp:Parameter Name="clockCount" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter Name="articleClass" Type="String" />
                <asp:Parameter DbType="Date" Name="pushTime" />
                <asp:Parameter Name="clockCount" Type="Int32" />
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter Name="original_articleClass" Type="String" />
                <asp:Parameter DbType="Date" Name="original_pushTime" />
                <asp:Parameter Name="original_clockCount" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="articleID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="93px" Width="752px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="articleTitle" HeaderText="标题" SortExpression="articleTitle" />
                <asp:BoundField DataField="articleClass" HeaderText="分类" SortExpression="articleClass" />
                <asp:BoundField DataField="articleID" HeaderText="文章序号" InsertVisible="False" ReadOnly="True" SortExpression="articleID" />
                <asp:BoundField DataField="pushTime" HeaderText="发布日期" SortExpression="pushTime" />
                <asp:BoundField DataField="clockCount" HeaderText="点击量" SortExpression="clockCount" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="articleID" DataNavigateUrlFormatString="changeArticle.aspx?articleID={0}" Text="修改" />
                <asp:HyperLinkField DataNavigateUrlFields="articleID" DataNavigateUrlFormatString="adminReview.aspx?articleID={0}" Text="管理评论" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <br />
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回上一页" />
&nbsp;</form>
</body>
</html>
