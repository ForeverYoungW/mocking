<%@ Page Language="C#" AutoEventWireup="true" CodeFile="useless.aspx.cs" Inherits="homePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 103%;
        }
        .auto-style6 {
            width: 120px;
        }
        .auto-style7 {
            width: 42px;
        }
        .auto-style8 {
            width: 392px;
        }
        .auto-style9 {
            width: 145px;
        }
        .auto-style12 {
            width: 100%;
        }
        .auto-style13 {
            height: 378px;
            width: 228px;
        }
        .auto-style15 {
            width: 226px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label1" runat="server" BorderColor="#FF66FF" ForeColor="Blue" Text="欢迎进入博客园"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:HyperLink ID="login" runat="server" ForeColor="Black" NavigateUrl="~/userLogin.aspx">登录</asp:HyperLink>
                </td>
                <td class="auto-style15">
                    <asp:HyperLink ID="register" runat="server" ForeColor="Black" NavigateUrl="~/userRegister.aspx">注册</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/managerLogin.aspx">管理员登录</asp:HyperLink>
                </td>
            </tr>
        </table>
&nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style9">
    
        <img alt="" src="photo\u=4198136651,1614669795&fm=23&gp=0.jpg" style="height: 224px; width: 372px" /></td>
                <td class="auto-style8">
                    <asp:Calendar ID="Calendar2" runat="server" Height="223px" Width="300px" style="margin-left: 0px"></asp:Calendar>
                </td>
            </tr>
        </table>
    
    </div>
        <asp:SqlDataSource ID="articleClass" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT [articleClass] FROM [classes]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="countDESC" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT [articleTitle], [clockCount], [articleID], [userID] FROM [articles] ORDER BY [clockCount] DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="main" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" SelectCommand="SELECT [articleClass], [articleTitle], [articleContent], [pushTime], [clockCount], [userID], [articleID] FROM [articles] ORDER BY [pushTime] DESC"></asp:SqlDataSource>
    
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/homePage.aspx">首页</asp:HyperLink>
        <table class="auto-style12">
            <tr>
                <td class="auto-style13">
                    <asp:DataList ID="DataList4" runat="server" DataSourceID="articleClass" Height="545px" Width="26px">
                        <ItemTemplate>
                            <asp:Label ID="articleClassLabel" runat="server"  />
                            <a href ='useless.aspx?articleClass=<%#Eval("articleClass") %>'> 
                                <%#Eval("articleClass") %>>
                            </a>
                            <br />
<br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="countDESC">
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
                    </asp:DataList>
                </td>
                <td>
                    <asp:DataList ID="DataList3" runat="server" CellPadding="4" DataSourceID="main" ForeColor="#333333" style="margin-left: 0px" Height="687px" Width="364px">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
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
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
        <br />
    
    </form>
</body>
</html>
