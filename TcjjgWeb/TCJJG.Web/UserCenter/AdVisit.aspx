<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdVisit.aspx.cs" Inherits="UserCenter_AdVisit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/QueryString.js" type="text/javascript"></script>
    <script type="text/javascript">
        function LinkTo(game) {
            var sp = QueryString("spread");
            if (null != sp) {
                location.href = "/Ajax/Ajax_Visitor.aspx?spread=" + sp + "&tg=1";
            }
        }
    </script>
</head>
<body style="background-color: #000000">
    <form id="form1" runat="server">
    <div style="width: 1024px; height: 768px; margin: 0 auto;">
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" style="width: 1024px;
            height: 768px;" id="load" align="middle">
            <param name="movie" value="/Images/SPVisit/adflash.swf" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#000000" />
            <param name="play" value="true" />
            <param name="loop" value="true" />
            <param name="wmode" value="opaque" />
            <param name="scale" value="showall" />
            <param name="menu" value="false" />
            <param name="devicefont" value="false" />
            <param name="salign" value="" />
            <param name="allowScriptAccess" value="sameDomain" />
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="/Images/SPVisit/adflash.swf" style="width: 1024px;
                height: 768px;">
                <param name="movie" value="/Images/SPVisit/adflash.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#000000" />
                <param name="play" value="true" />
                <param name="loop" value="true" />
                <param name="wmode" value="opaque" />
                <param name="scale" value="showall" />
                <param name="menu" value="false" />
                <param name="devicefont" value="false" />
                <param name="salign" value="" />
                <param name="allowScriptAccess" value="sameDomain" />
                <!--<![endif]-->
                <a href="http://www.adobe.com/go/getflash">
                    <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
                        alt="获得 Adobe Flash Player" />
                </a>
                <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
        </object>
    </div>
    </form>
</body>
</html>
