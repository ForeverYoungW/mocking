<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clipExample.aspx.cs" Inherits="clipExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        原图：<img src="photo/CIMG0061.JPG" alt="" />
        取左上角的图
        <img src="photo/CIMG0061.JPG" alt=""
            style="position:absolute;top:40px;left:180px;clip:rect(1px,29px,29px,1px);" />
        取上方中间的图
        <img src="photo/CIMG0061.JPG" alt="" 
            style="position:absolute;top:40px;left:250px;clip:rect(1px,55px,29px,29px);" />
    </div>
    </form>
</body>
</html>
