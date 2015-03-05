<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HallPageFL.aspx.cs" Inherits="HallPage_HallPageFL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>同城竞技馆</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <style type="text/css" media="screen">
        html, body, #divmain
        {
            height: 100%;
            width: 100%;
        }
        body
        {
            margin: 0;
            padding: 0;
            overflow: auto;
            background-image: url(/HallPage/Image/bg.png);
            background-repeat: repeat;
        }
        object:focus
        {
            outline: none;
        }
        #flashContent
        {
            display: none;
        }
    </style>
    <!-- Enable Browser History by replacing useBrowserHistory tokens with two hyphens -->
    <!-- BEGIN Browser History required section -->
    <link rel="stylesheet" type="text/css" href="/Flash/history/history.css" />
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/QueryString.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Flash/history/history.js"></script>
    <!-- END Browser History required section -->
    <script type="text/javascript" src="/Flash/swfobject.js"></script>
    <script src="/Scripts/HallPageFL.js" type="text/javascript"></script>
    <script type="text/javascript">
        // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
        var swfVersionStr = "11.1.0";
        // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
        var xiSwfUrlStr = "/Flash/playerProductInstall.swf";
        var flashvars = {};
        var params = {};
        params.quality = "high";
        params.bgcolor = "#244868";
        params.allowscriptaccess = "always";
        params.allowfullscreen = "true";
        params.wmode = "Opaque";
        var attributes = {};
        attributes.id = "CMOP_HallClient";
        attributes.name = "CMOP_HallClient";
        attributes.align = "middle";
        swfobject.embedSWF(
                "/Flash/CMOP_HallClientV2.swf", "divmain",
                "100%", "100%",
                swfVersionStr, xiSwfUrlStr,
                flashvars, params, attributes);
        // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
        swfobject.createCSS("#flashContent", "display:block;text-align:left;");
    </script>
</head>
<body>
    <div id="mallDiv" style="position: absolute; top: 50%; left: 50%; margin: -150px 0 0 -200px;
        width: 400px; height: 300px; border: 1px solid #008800; z-index: 1000; display: none">
        <iframe id="iframe" name="iframe" scrolling="auto" width="100%" height="300px" frameborder="0">
        </iframe>
    </div>
    <div id="divmain">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"
            id="CMOP_HallClientV2">
            <param name="movie" value="CMOP_HallClientV2.swf" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <param name="allowScriptAccess" value="sameDomain" />
            <param name="allowFullScreen" value="true" />
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="CMOP_HallClientV2.swf" width="100%"
                height="100%">
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                <p>
                    <a href="http://www.adobe.com/go/getflashplayer">您未安装Flash插件或Flash播放器版本太低，请 点击更新Flash播放器.</a>
                </p>
                <!--<![endif]-->
                <a href="http://www.adobe.com/go/getflashplayer">
                    <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
                        alt="下 载最新Flash版本" />
                </a>
                <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
        </object>
    </div>
    <form id="form1" runat="server">
    <input type="hidden" id="hdUid" runat="server" />
    <input type="hidden" id="hdUpwd" runat="server" />
    <input type="hidden" id="hdAppID" runat="server" />
    <input type="hidden" id="hdIsTaste" runat="server" />
    <input type="hidden" id="hdNickName" runat="server" />
    <input type="hidden" id="hdType1" runat="server" />
    <input type="hidden" id="hdType4" runat="server" />
    <input type="hidden" id="hdUserType" runat="server" />
    <input type="hidden" id="hdMoreopen" runat="server" />
    <input type="hidden" id="hdrank" runat="server" />
    </form>
    <script language="javascript" type="text/javascript">
      
    </script>
    <div style="display: none;">
        <script src="http://s132.cnzz.com/stat.php?id=1443449&web_id=1443449&show=pic" language="JavaScript"
            type="text/javascript" charset="gb2312"></script>
    </div>
</body>
</html>
