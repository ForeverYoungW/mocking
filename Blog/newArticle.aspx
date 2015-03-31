<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newArticle.aspx.cs" Inherits="newArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 160px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="userID" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="标题"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:TextBox ID="articleTitle" runat="server" style="margin-right: 2px" Width="426px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    分类</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:DropDownList ID="articleClass" runat="server" DataSourceID="Type" DataTextField="articleClass" DataValueField="articleClass" OnSelectedIndexChanged="articleClass_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Type" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT * FROM [classes]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="正文"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:TextBox ID="articleContent" runat="server" Height="266px" Width="430px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="hand" runat="server" Height="23px" Text="提交" Width="72px" OnClick="Button1_Click" />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="返回（我的博客）" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
