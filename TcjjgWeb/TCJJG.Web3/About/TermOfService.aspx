<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TermOfService.aspx.cs" Inherits="About_TermOfService" %>

<%@ Register Src="../UserControl/About.ascx" TagName="About" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/About.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_UCAboutContainer">
        <uc1:About ID="About1" runat="server" />
        <div class="RightContainer">
            <div class="ContentTitle">
                <strong>服务条款</strong>
            </div>
            <div class="Content">
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>隐私权声明</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    CMOP注重对保护您的个人隐私的保护。有时候我们需要某些信息才能为您提供您请求的服务，本隐私权声明解释了这些情况下的数据收集和使用情况。本隐私权声明适用于CMOP网站的所有相关服务。</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>您个人信息的搜集</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    当我们需要能识别您身份的信息（个人信息）或者可以与您联系的信息时，我们会征求您的同意。通常，在您注册帐号或其他CMOP在线服务时，我们会请求您提供这些信息。CMOP搜集的信息通常仅限于您的姓名、性别、年龄、出生日期、身份证号、家庭住址、教育程度、公司情况、所属行业、兴趣爱好等。</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>控制您的个人信息</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    CMOP会在法律要求或符合CMOP官网的相关服务条款、软件许可使用协议约定的情况下透露您的个人信息，或者有充分理由相信必须这样做才能：(a) 满足法律的明文规定，或者符合CMOP或本站点适用的法律程序；（b）符合CMOP官网相关服务条款、软件许可使用协议的约定；(c)
                    保护CMOP及其系列 Web 站点的权利或财产，以及 (d) 在紧急情况下保护CMOP员工、CMOP产品或服务的用户或大众的个人安全。<br /><br />
                    CMOP不会未经允许将这些信息与第三方共享，本声明已经列出的情况除外。</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>您个人信息的安全</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    严格保护您的个人信息的安全。我们使用各种安全技术和程序来保护您的个人信息不被未经授权的访问、使用或泄漏。如果您对我们的隐私保护有任何置疑，请email至cmop@126.com</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>访问您的个人信息</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    我们为您提供了多种途径以确保您的个人信息是准确及时的。如果您在CMOP网站上注册，您可以随时查阅或编辑您提交给CMOP网站的个人信息，您也可以随时删除您提交给CMOP网站的个人信息。</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>对青少年个人信息的搜集和使用</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    CMOP非常重视对青少年个人信息搜集和使用的安全性和保护。腾讯建议，任何16岁以下的未成年人参加网上活动应事先取得家长或其法定监护人（以下简称&quot;监护人&quot;）的书面同意。
                    未经监护人事先同意，CMOP不会使用青少年的个人信息，也不会向任何第三方透露可识别的信息，除非是为了向青少年提供服务之必要。 经监护人同意，CMOP可以搜集青少年的个人信息，但监护人有权拒绝CMOP进一步搜集其子女或被监护人的个人信息，有权审阅或要求CMOP删除该青少年的个人信息。
                    CMOP保证不会要求青少年提供额外的个人资料，以作为允许其参与网上活动的条件。</p>
                <br />
                <p>
                    <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle"  />&nbsp;<strong>关于免责</strong><img
                        src="../Images/About/tcjjg_2012__tkbelowline.jpg" /></p>
                <p class="p_content">
                    就下列相关事宜的发生，CMOP不承担任何法律责任：</p>
                <p class="p_content">
                    1.CMOP根据法律规定或相关政府的要求提供您的个人信息；</p>
                <p class="p_content">
                    2.由于您将用户密码告知他人或与他人共享注册帐户，由此导致的任何个人信息的泄漏，或其他非因CMOP原因导致的个人信息的泄漏；</p>
                <p class="p_content">
                    3.任何第三方根据CMOP各服务条款及声明中所列明的情况使用您的个人信息，由此所产生的纠纷；</p>
                <p class="p_content">
                    4.任何由于黑客攻击、电脑病毒侵入或政府管制而造成的暂时性网站关闭；</p>
                <p class="p_content">
                    5.因不可抗力导致的任何后果；</p>
                <p class="p_content">
                    6.CMOP在各服务条款及声明中列明的使用方式或免责情形。</p>
                <p class="p_content">
                    CMOP会不时更新本隐私权声明。更新时，我们还会修改隐私权声明顶部的&quot;最近更新&quot;的日期。</p>
            </div>
        </div>
    </div>
        <script type="text/javascript">
            $("#A_About").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });

            $("#TermOfService").css({ "background-image": "url('../Images/About/tcjjg_2012__sel.jpg')", "color": "rgb(244,111,6)", "font-weight": "bold", "background-position": "right" });
            $(".D_UCAboutContainer").css("height", "1900px");
            $(".D_UCAboutLeft").css("height", "1900px");
    </script>
</asp:Content>
