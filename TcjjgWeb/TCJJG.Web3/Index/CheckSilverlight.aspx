<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/DownLoadSilverlight.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/Silverlight.js" type="text/javascript"></script>
    <script src="../Js/common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_DownLoadContainer">
        <br />
        <br />
        <span>尊敬的玩家，您好：</span><br />
        <br />
        <span>您尚未安装游戏插件。请从下列推荐站点中选择适合您的站点下载、安装，这可能会花费您一分钟的时间。<br />
            <br />
        安装完成后，请刷新页面享受全新体验！</span>
        <div class="SpanBold">祝您有一个愉快的竞技之旅！</div>
        <span>本地下载1(SilverLight-4.0)</span>
        <div class="DownLoadUrl">
            下载地址1：<a href="http://download.tcjjg.com/Silverlight-4.0.exe" target="_blank">http://www.tcjjg.com/download1</a></div>
        <span>华军下载中心</span>
        <div class="DownLoadUrl">
            下载地址：<a href="http://www.onlinedown.net/soft/96682.htm" target="_blank">http://www.onlinedown.net/soft/96682.htm</a></div>
        <span>天空软件站</span>
        <div class="DownLoadUrl">
            下载地址：<a href="http://www.skycn.com/soft/40492.html" target="_blank">http://www.skycn.com/soft/40492.html</a></div>
    </div>
        <script type="text/javascript" language="javascript">
            function gotosv() {
                if (isInstallSilverlightForWeb) {
                    alert("安装完成啦！开始游戏吧！");
                    f_gotoHall();
                }
                else {
                }
            }
            CheckSl(); gotosv();
    </script>
</asp:Content>
