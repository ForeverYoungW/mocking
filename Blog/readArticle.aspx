<%@ Page Language="C#" AutoEventWireup="true" CodeFile="readArticle.aspx.cs" Inherits="readArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="article" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT [userID], [articleTitle], [articleContent], [articleClass], [pushTime], [clockCount] FROM [articles] WHERE ([articleTitle] = @articleTitle)">
            <SelectParameters>
                <asp:QueryStringParameter Name="articleTitle" QueryStringField="articleTitle" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT [penName], [reviewContent], [reviewRespond] FROM [reviews] WHERE ([articleID] = @articleID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="articleID" QueryStringField="articleid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" DeleteCommand="DELETE FROM [reviews] WHERE [ID] = @original_ID AND [reviewID] = @original_reviewID AND [userID] = @original_userID AND [articleTitle] = @original_articleTitle AND [articleID] = @original_articleID AND [penName] = @original_penName AND [reviewContent] = @original_reviewContent AND (([reviewRespond] = @original_reviewRespond) OR ([reviewRespond] IS NULL AND @original_reviewRespond IS NULL))" InsertCommand="INSERT INTO [reviews] ([reviewID], [userID], [articleTitle], [articleID], [penName], [reviewContent], [reviewRespond]) VALUES (@reviewID, @userID, @articleTitle, @articleID, @penName, @reviewContent, @reviewRespond)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [reviews]" UpdateCommand="UPDATE [reviews] SET [reviewID] = @reviewID, [userID] = @userID, [articleTitle] = @articleTitle, [articleID] = @articleID, [penName] = @penName, [reviewContent] = @reviewContent, [reviewRespond] = @reviewRespond WHERE [ID] = @original_ID AND [reviewID] = @original_reviewID AND [userID] = @original_userID AND [articleTitle] = @original_articleTitle AND [articleID] = @original_articleID AND [penName] = @original_penName AND [reviewContent] = @original_reviewContent AND (([reviewRespond] = @original_reviewRespond) OR ([reviewRespond] IS NULL AND @original_reviewRespond IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_reviewID" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_penName" Type="String" />
                <asp:Parameter Name="original_reviewContent" Type="String" />
                <asp:Parameter Name="original_reviewRespond" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="reviewID" Type="Int32" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter Name="articleID" Type="Int32" />
                <asp:Parameter Name="penName" Type="String" />
                <asp:Parameter Name="reviewContent" Type="String" />
                <asp:Parameter Name="reviewRespond" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="reviewID" Type="Int32" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="articleTitle" Type="String" />
                <asp:Parameter Name="articleID" Type="Int32" />
                <asp:Parameter Name="penName" Type="String" />
                <asp:Parameter Name="reviewContent" Type="String" />
                <asp:Parameter Name="reviewRespond" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_reviewID" Type="Int32" />
                <asp:Parameter Name="original_userID" Type="String" />
                <asp:Parameter Name="original_articleTitle" Type="String" />
                <asp:Parameter Name="original_articleID" Type="Int32" />
                <asp:Parameter Name="original_penName" Type="String" />
                <asp:Parameter Name="original_reviewContent" Type="String" />
                <asp:Parameter Name="original_reviewRespond" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="article">
            <ItemTemplate>
                作者:
                <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
                <br />
                <br />
                标题:
                <asp:Label ID="articleTitleLabel" runat="server" Text='<%# Eval("articleTitle") %>' />
                <br />
                <br />
                内容:
                <asp:Label ID="articleContentLabel" runat="server" Text='<%# Eval("articleContent") %>' />
                <br />
                <br />
                分类:
                <asp:Label ID="articleClassLabel" runat="server" Text='<%# Eval("articleClass") %>' />
                <br />
                <br />
                发布日期:
                <asp:Label ID="pushTimeLabel" runat="server" Text='<%# Eval("pushTime") %>' />
                <br />
                <br />
                点击量:
                <asp:Label ID="clockCountLabel" runat="server" Text='<%# Eval("clockCount") %>' />
                <br />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
    
    </div>
        <asp:Label ID="articleID" runat="server" Text="Label"></asp:Label>
        <p>
            <asp:Label ID="articleTitle" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="authorID" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            添加新评论</p>
        <p>
            <asp:TextBox ID="penName" runat="server" ReadOnly="True"></asp:TextBox>
            （昵称）</p>
        <p>
        <asp:TextBox ID="review" runat="server" Height="115px" Width="540px" TextMode="MultiLine"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="submit" runat="server" OnClick="Button1_Click" Text="提交评论" style="height: 21px" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="返回首页" />
&nbsp;</p>
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                评论人:
                <asp:Label ID="penNameLabel" runat="server" Text='<%# Eval("penName") %>' />
                <br />
                评论内容:
                <asp:Label ID="reviewContentLabel" runat="server" Text='<%# Eval("reviewContent") %>' />
                <br />
                主任回复:
                <asp:Label ID="reviewRespondLabel" runat="server" Text='<%# Eval("reviewRespond") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
