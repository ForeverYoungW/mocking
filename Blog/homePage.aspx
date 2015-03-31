<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homePage.aspx.cs" Inherits="temp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 145px;
        }
        .auto-style4 {
            width: 35px;
        }
        .auto-style5 {
            width: 395px;
        }
        .auto-style6 {
            width: 221px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <table class="auto-style1">
                    <tr>
                <td class="auto-style3">
                    <embed src="/音乐文件夹/佟大为 - 放飞.mp3"width="1" height="1" type="audio/mpeg" loop="true" autostart="true" id="MP3" />
                    <asp:Label ID="Label1" runat="server" BorderColor="#FF66FF" ForeColor="Blue" Text="欢迎进入博客园"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:HyperLink ID="login" runat="server" ForeColor="Black" NavigateUrl="~/userLogin.aspx">登录</asp:HyperLink>
                </td>
                <td class="auto-style6">
                    <asp:HyperLink ID="register" runat="server" ForeColor="Black" NavigateUrl="~/userRegister.aspx">注册</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/managerLogin.aspx">管理员登录</asp:HyperLink>
                </td>
            </tr>
        </table>
&nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style5">
    
        <img alt="" src="photo\u=4198136651,1614669795&fm=23&gp=0.jpg" style="height: 224px; width: 372px" /></td>
                <td class="auto-style8">
                    <asp:Calendar ID="Calendar2" runat="server" Height="223px" Width="300px" style="margin-left: 0px"></asp:Calendar>
                </td>
            </tr>
                    <tr>
                        <td class="auto-style5">
                <asp:Repeater ID="classes" runat="server">
                    <ItemTemplate>
                            <asp:Label ID="articleClassLabel" runat="server"  />
                            <a href ="homePage.aspx?articleClass=<%#Eval("articleClass") %>"> 
                                <%#Eval("articleClass") %>>
                            </a>
                            <br />
<br />
                    </ItemTemplate>
                </asp:Repeater>
                            <asp:TextBox ID="pageIndex2" runat="server">1</asp:TextBox>
                            <asp:Button ID="jump2" runat="server" Text="跳转" OnClick="jump2_Click" />
                            共<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            页</td>
                        <td rowspan="2">
                <asp:Repeater ID="article" runat="server">
             <HeaderTemplate>
                <table border:"10" style="width: 50%;">
            </HeaderTemplate>
            <ItemTemplate>
                分类:
                <asp:Label ID="articleClassLabel" runat="server" Text='<%# Eval("articleClass") %>' />
                <br />
                标题:
                <asp:Label ID="articleTitleLabel" runat="server"  />
                <a href ="readArticle.aspx?articleTitle=<%#Eval("articleTitle") %>&authorid=<%#Eval ("userID") %>&articleid=<%#Eval ("articleID") %>">
                <%#Eval("articleTitle") %>>
                </a>
                <br />
                正文:
                <asp:Label ID="articleContentLabel" runat="server" />
                <%# Eval("articleContent").ToString().Substring(0,Eval ("articleContent").ToString ().Length >30?30:Eval ("articleContent").ToString ().Length ) %>
                </a>
                <br />
                发布时间:
                <asp:Label ID="pushTimeLabel" runat="server" Text='<%# Eval("pushTime") %>' />
                <br />
                点击量:
                <asp:Label ID="clockCountLabel" runat="server" Text='<%# Eval("clockCount") %>' />
                <br />
                作者:
                <asp:Label ID="userIDLabel" runat="server" />
                <a href ="readAuthor.aspx?articleAuthor=<%#Eval("userID") %>">
                <%#Eval("userID") %>>
                </a>
                <br />
                文章编号:
                <asp:Label ID="articleIDLabel" runat="server" Text='<%# Eval("articleID") %>' />
                <br />
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:TextBox ID="pageIndex1" runat="server">1</asp:TextBox>
        <asp:Button ID="jump1" runat="server" OnClick="Button1_Click" Text="跳转" />
                            共<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                            页</td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Repeater ID="top" runat="server">
                        <ItemTemplate>
                            标题:
                            <asp:Label ID="articleTitleLabel" runat="server"  />
                            <a href ="readArticle.aspx?articleTitle=<%#Eval("articleTitle") %>&authorid=<%#Eval ("userID") %>&articleid=<%#Eval ("articleID") %>">
                            <%#Eval("articleTitle") %>>
                            </a>
                            <br />
                            点击量:
                            <asp:Label ID="clockCountLabel" runat="server" Text='<%# Eval("clockCount") %>' />
                            <br />
                            ID:
                            <asp:Label ID="articleIDLabel" runat="server" Text='<%# Eval("articleID") %>' />
<br />
                            作者:
                            <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                            </asp:Repeater>
                            <asp:TextBox ID="pageIndex3" runat="server">1</asp:TextBox>
                            <asp:Button ID="jump3" runat="server" Text="跳转" OnClick="jump3_Click" />
                            共<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                            页</td>
                    </tr>
                </table>
        <br />
    </form>
</body>
</html>
