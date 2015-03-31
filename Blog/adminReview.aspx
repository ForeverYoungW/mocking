<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminReview.aspx.cs" Inherits="adminReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" DeleteCommand="DELETE FROM [reviews] WHERE [reviewID] = @original_reviewID AND [userID] = @original_userID AND [articleTitle] = @original_articleTitle AND [articleID] = @original_articleID AND [penName] = @original_penName AND [reviewContent] = @original_reviewContent AND (([reviewRespond] = @original_reviewRespond) OR ([reviewRespond] IS NULL AND @original_reviewRespond IS NULL))" InsertCommand="INSERT INTO [reviews] ([userID], [articleTitle], [articleID], [penName], [reviewContent], [reviewRespond]) VALUES (@userID, @articleTitle, @articleID, @penName, @reviewContent, @reviewRespond)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [reviews] WHERE ([articleID] = @articleID)" UpdateCommand="UPDATE [reviews] SET [userID] = @userID, [articleTitle] = @articleTitle, [articleID] = @articleID, [penName] = @penName, [reviewContent] = @reviewContent, [reviewRespond] = @reviewRespond WHERE [reviewID] = @original_reviewID AND [userID] = @original_userID AND [articleTitle] = @original_articleTitle AND [articleID] = @original_articleID AND [penName] = @original_penName AND [reviewContent] = @original_reviewContent AND (([reviewRespond] = @original_reviewRespond) OR ([reviewRespond] IS NULL AND @original_reviewRespond IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_reviewID" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_penName" Type="String" />
                <asp:Parameter Name="original_reviewContent" Type="String" />
                <asp:Parameter Name="original_reviewRespond" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter Name="articleID" Type="Int32" />
                <asp:Parameter Name="penName" Type="String" />
                <asp:Parameter Name="reviewContent" Type="String" />
                <asp:Parameter Name="reviewRespond" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="articleID" QueryStringField="articleID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter Name="articleID" Type="Int32" />
                <asp:Parameter Name="penName" Type="String" />
                <asp:Parameter Name="reviewContent" Type="String" />
                <asp:Parameter Name="reviewRespond" Type="String" />
                <asp:Parameter Name="original_reviewID" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_penName" Type="String" />
                <asp:Parameter Name="original_reviewContent" Type="String" />
                <asp:Parameter Name="original_reviewRespond" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="reviewID" DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="reviewID" HeaderText="序号" InsertVisible="False" ReadOnly="True" SortExpression="reviewID" />
                <asp:BoundField DataField="userID" HeaderText="作者" SortExpression="userID" />
                <asp:BoundField DataField="articleTitle" HeaderText="标题" SortExpression="articleTitle" />
                <asp:BoundField DataField="articleID" HeaderText="文章序号" SortExpression="articleID" />
                <asp:BoundField DataField="penName" HeaderText="评论者" SortExpression="penName" />
                <asp:BoundField DataField="reviewContent" HeaderText="评论内容" SortExpression="reviewContent" />
                <asp:BoundField DataField="reviewRespond" HeaderText="回复内容" SortExpression="reviewRespond" />
                <asp:CommandField ShowDeleteButton="True" />
                <asp:HyperLinkField DataNavigateUrlFields="reviewID" DataNavigateUrlFormatString="reviewRespond.aspx?reviewID={0}" Text="回复" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="返回我的博客" />
    </form>
</body>
</html>
