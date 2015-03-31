<%@ Page Language="C#" AutoEventWireup="true" CodeFile="managerLogin.aspx.cs" Inherits="manager" %>

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
            width: 253px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <p>
            &nbsp;</p>
        &nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
    
        <asp:Label ID="Label1" runat="server" Text="管理员登录"></asp:Label>
    
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
        <asp:Label ID="Label2" runat="server" Text="账号"></asp:Label>
        <asp:TextBox ID="managerID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
            <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label>
            <asp:TextBox ID="managerPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
        <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回首页" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
