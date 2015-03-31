<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userRegister.aspx.cs" Inherits="userRegister" %>

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
            width: 258px;
        }
        .auto-style3 {
            width: 258px;
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
        }
        .auto-style6 {
            width: 258px;
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style8 {
            width: 258px;
            height: 25px;
        }
        .auto-style9 {
            height: 25px;
        }
        .auto-style10 {
            height: 25px;
            width: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <img alt="" src="photo\u=2245731832,2519811217&fm=23&gp=0.jpg" />&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">用户名</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4" colspan="2">
                    <asp:TextBox ID="userID" runat="server" MaxLength="10"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">密码</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="userPassword1" runat="server" TextMode="Password" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4" colspan="2">确认密码</td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style4" colspan="2">
                    <asp:TextBox ID="userPassword2" runat="server" TextMode="Password" MaxLength="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">头像（*可不填）</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td colspan="2" class="auto-style7">
                    <asp:FileUpload ID="userPicture" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <img alt="" src="Request.MapPath(userPicture.PostedFile.FileName)" style="height: 137px; width: 113px" /></td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">性别（*可不填）</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:DropDownList ID="userSex" runat="server">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">出生日期（*可不填，格式为YYYY-MM-DD）</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:TextBox ID="userBirthday" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">电子邮箱（*可不填）</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7" colspan="2">
                    <asp:TextBox ID="userEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确认注册" />
                </td>
            </tr>
            <tr>
                <td class="auto-style8"></td>
                <td class="auto-style10">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 0px" Text="返回首页" />
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
