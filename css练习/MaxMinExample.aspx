<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaxMinExample.aspx.cs" Inherits="MaxMinExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="text-align:center">
    <form id="form1" runat="server">
        <p>当缩小浏览器窗口到div限定的最小限度时，将出现滚动条，无法再缩小div。</p>
    <div style="margin:0 auto;border:1px solid;width:400px;min-width:250px;height:30px">div</div>
    </form>
</body>
</html>
