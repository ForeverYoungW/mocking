<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changeArticle.aspx.cs" Inherits="changeArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        文章编号<asp:Label ID="articleID" runat="server" Text="Label"></asp:Label>
        <br />
        <p>
            标题</p>
        <p>
            <asp:TextBox ID="articleTitle" runat="server" Width="470px"></asp:TextBox>
        </p>
        <p>
            正文</p>
        <p>
            <asp:TextBox ID="articleContent" runat="server" Height="239px" TextMode="MultiLine" Width="639px"></asp:TextBox>
        </p>
        <p>
            分类</p>
        <p>
            <asp:DropDownList ID="articleClass" runat="server" DataSourceID="Type" DataTextField="articleClass" DataValueField="articleClass">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Type" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT * FROM [classes]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="更新" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回上一页" />
        </p>
    </form>
</body>
</html>
