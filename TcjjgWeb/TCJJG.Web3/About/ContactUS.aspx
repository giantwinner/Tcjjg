<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ContactUS.aspx.cs" Inherits="About_ContactUS" %>

<%@ Register Src="../UserControl/About.ascx" TagName="About" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/About.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_UCAboutContainer">
        <uc1:About ID="About1" runat="server" />
        <div class="RightContainer" style="height: 1100px;">
            <div class="ContentTitle">
                <strong>联系我们</strong>
            </div>
            <div class="Content" style="height: 1008px;">
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle" />&nbsp;<strong>客服服务</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    如果您在游戏及比赛过程出现任何问题，或对游戏及比赛有良好的意见和建议，请与我们的客服人员联系。<br />
                    <span style="font-weight: bold">在线客服：</span> <a class="EnterService" href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes"
                        target="_blank"></a>
                    <br />
                    <span style="font-weight: bold">客服&nbsp;QQ：</span>243559966(10:00-12:30、13:00-18:00)<br />
                    <span style="font-weight: bold">客服电话：</span>4007706700(10:00-12:30、13:00-18:00)<br />
                    <span style="font-weight: bold">客服信箱：</span>cmopcn@126.com</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle" />&nbsp;<strong>联系中游</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    <span style="font-weight: bold; color: Black">中游竞技文化股份有限公司</span><br />
                    <span style="font-weight: bold">通信地址：</span>海南省海口市龙华区龙昆北路2号珠江广场帝晶大厦17A房<br />
                    <span style="font-weight: bold">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编</span>：570125<br />
                    <br />
                    <span style="font-weight: bold; color: Black">中游竞技文化股份有限公司北京分公司</span><br />
                    <span style="font-weight: bold">通信地址：</span>北京市石景山区石景山路20号中铁建设大厦15层<br />
                    <span style="font-weight: bold">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</span>010-52656153<br />
                    <span style="font-weight: bold">传&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;真：</span>010-52656153<br />
                    <span style="font-weight: bold">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</span>100131<br />
                    <span style="font-weight: bold">E-mail&nbsp;&nbsp;：</span>cmopcn@sina.com</p>
                <br />
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle" />&nbsp;<strong>北京位置图：</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" />
                </p>
                <img class="map" src="../Images/About/tcjjg_2012__map.jpg" />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_About").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $("#ContactUS").css({ "background-image": "url('../Images/About/tcjjg_2012__sel.jpg')", "color": "rgb(244,111,6)", "font-weight": "bold", "background-position": "right" });
        $(".D_UCAboutContainer").css("height", "1150px");
        $(".D_UCAboutLeft").css("height", "1150px");
    </script>
</asp:Content>
