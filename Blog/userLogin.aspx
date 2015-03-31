<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userLogin.aspx.cs" Inherits="userLogin" %>

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
            width: 252px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
    
            <img alt="" src="photo\u=2739503377,3713347633&fm=23&gp=0.jpg" style="height: 162px; width: 243px" /></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="账号" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:TextBox ID="userID" runat="server" Height="22px" Width="155px" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:TextBox ID="userPassword" runat="server" TextMode="Password" Height="22px" Width="152px" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
            <asp:Button ID="login" runat="server" Text="登录" Height="24px" Width="63px" OnClick="login_Click" />
            <asp:Button ID="return" runat="server" Text="取消" Height="24px" Width="63px" OnClick="return_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
