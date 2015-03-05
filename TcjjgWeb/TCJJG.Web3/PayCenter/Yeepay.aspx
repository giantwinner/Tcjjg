<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Yeepay.aspx.cs" Inherits="PayCenter_Yeepay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="/js/common.js" type="text/javascript"></script>
    <script src="../js/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body style="font-family: 微软雅黑;">
    <form id="form1" runat="server" class="subPage_form">
    <div style="margin-left: 50px; width: 510px;">
        <asp:Panel ID="pl_y_bank" runat="server" Visible="false">
            <div class="pay_body_main2_body1">
                <div class="yeepay_Title">
                    网络银行充值
                </div>
                <div class="pay_body_main2_body_text">
                    购买物品：</div>
                <div class="pay_body_main2_body_text_1">
                    元宝</div>
            </div>
            <div class="pay_body_main2_body2">
                <div class="pay_body_main2_body_text2_YeepayBank">
                    购买金额：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_bank_je20" runat="server" Text="充值20元,可获得200元宝(可兑换100000金币)"
                            GroupName="y_bank_jegn" /><br />
                        <asp:RadioButton ID="rb_y_bank_je50" runat="server" Text="充值50元,可获得500元宝(可兑换250000金币)"
                            GroupName="y_bank_jegn" Checked="true" /><br />
                        <asp:RadioButton ID="rb_y_bank_je100" runat="server" Text="充值100元,可获得1000元宝(可兑换500000金币)"
                            GroupName="y_bank_jegn" /><br />
                        <asp:RadioButton ID="rb_y_bank_je500" runat="server" Text="充值500元,可获得5000元宝(可兑换2500000金币)"
                            GroupName="y_bank_jegn" />
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body3" style="top: 80px">
                <div class="pay_body_main2_body_text3">
                    选择银行：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_bank_yhGSYH" runat="server" Text="工商银行" GroupName="y_bank_yhgn"
                            Checked="true" />
                        <asp:RadioButton ID="rb_y_bank_yhNYYH" runat="server" Text="农业银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhJTYH" runat="server" Text="交通银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhZSYH" runat="server" Text="招商银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhGZSNXS" runat="server" Text="广州农信社" GroupName="y_bank_yhgn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_bank_yhJSYH" runat="server" Text="建设银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhGFYH" runat="server" Text="广发银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhMSYH" runat="server" Text="民生银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhXYYH" runat="server" Text="兴业银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhGZSSYYH" runat="server" Text="广州商业银行" GroupName="y_bank_yhgn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_bank_yhZXYH" runat="server" Text="中信银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhGDYH" runat="server" Text="光大银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhBJYH" runat="server" Text="北京银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhPFYH" runat="server" Text="浦发银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhSDNXS" runat="server" Text="顺德农信社" GroupName="y_bank_yhgn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_bank_yhZGYH" runat="server" Text="中国银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhSZFZ" runat="server" Text="深圳发展" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhNJYH" runat="server" Text="南京银行" GroupName="y_bank_yhgn" />
                        <asp:RadioButton ID="rb_y_bank_yhSHNCSYYH" runat="server" Text="上海农村商业银行" GroupName="y_bank_yhgn" />
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body4" style="top: 80px">
                <div class="pay_body_main2_body_text">
                    帐号确认：</div>
                <div class="pay_body_main2_body_text_1_1">
                    <asp:TextBox ID="txtUserName_Bank" runat="server" class="help_textBox" Enabled="false"
                        ReadOnly="true" Font-Bold="true"></asp:TextBox>
                    (请您确认要充值的帐号)
                </div>
            </div>
            <div class="pay_body_main2_body5" style="top: 80px">
                <asp:ImageButton ID="btnBank" runat="server" CssClass="div_button2" ImageUrl="../Images/SubPage/payCenterBtnOk.jpg"
                    OnClick="btnOK_Click" />
            </div>
            <div class="pay_body_main2_body6" style="top: 80px">
                该充值方式兑换比率为：1元=10元宝=5000金币
            </div>
        </asp:Panel>
        <asp:Panel ID="pl_y_szx" runat="server" Visible="false">
            <div class="pay_body_main2_body1">
                <div class="yeepay_Title">
                    神州行卡充值
                </div>
                <div class="pay_body_main2_body_text">
                    购买物品：</div>
                <div class="pay_body_main2_body_text_1">
                    元宝</div>
            </div>
            <div class="pay_body_main2_body2_shenzhou">
                <div class="pay_body_main2_body_text2">
                    购买金额：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_szx_je30" runat="server" Text="充值30元卡,可获得240元宝(可兑换120000金币)"
                            GroupName="y_szx_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_szx_je50" runat="server" Text="充值50元卡,可获得400元宝(可兑换200000金币)"
                            GroupName="y_szx_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_szx_je100" runat="server" Text="充值100元卡,可获得800元宝(可兑换400000金币)"
                            GroupName="y_szx_jegn" />
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body4">
                <div class="pay_body_main2_body_text">
                    帐号确认：</div>
                <div class="pay_body_main2_body_text_1_3">
                    <asp:TextBox ID="txtUserName_SZX" runat="server" CssClass="help_textBox" Enabled="false"
                        ReadOnly="true" Font-Bold="true"></asp:TextBox>(请您确认要充值的帐号)
                </div>
            </div>
            <div class="pay_body_main2_body5">
                <asp:ImageButton ID="btnSZX" runat="server" CssClass="div_button2" ImageUrl="../Images/SubPage/payCenterBtnOk.jpg"
                    OnClick="btnOK_Click" />
            </div>
            <div class="pay_body_main2_body6_shenzhou">
                支付说明：
                <p>
                    1、请务必使用与您选择的充值卡面额相同的卡进行充值。
                </p>
                <p>
                    2、支持中国移动发行的神州行通用卡（密码18位，卡号17 位），江苏充值卡（密码17位，卡号16位），浙江充值卡（密码8位，卡号10位），辽宁充值卡 （密码21位，卡号16位）</p>
                <p>
                    3、支持面值30元、50元、100元充值卡。</p>
                <p>
                    <font color="red">注意：请务必使用与您选择的面额相同的神州行卡进行支付，否则引起的交易失败交易金额不予退还。</font> 如：选择50元面额但使用100元卡支付，则系统认为实际支付金额为50元，高于50元部分不予退还；选择50元面额但使用30元卡支付则系统认为支付失败，30元不予退还。
                </p>
            </div>
            <div class="pay_body_main2_body88_shenzhou" style="*top: 500px; _top: 500px;">
                该充值方式兑换比率为：1元=8元宝=4000金币 
            </div>
        </asp:Panel>
        <asp:Panel ID="pl_y_lt" runat="server" Visible="false">
            <div class="pay_body_main2_body1">
                <div class="yeepay_Title">
                    联通全国卡充值
                </div>
                <div class="pay_body_main2_body_text">
                    购买物品：</div>
                <div class="pay_body_main2_body_text_1">
                    元宝</div>
            </div>
            <div class="pay_body_main2_body2_shenzhou">
                <div class="pay_body_main2_body_text2">
                    购买金额：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_lt_je30" runat="server" Text="充值30元卡,可获得240元宝(可兑换120000金币)"
                            GroupName="y_lt_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_lt_je50" runat="server" Text="充值50元卡,可获得400元宝(可兑换200000金币)"
                            GroupName="y_lt_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_lt_je100" runat="server" Text="充值100元卡,可获得800元宝(可兑换400000金币)"
                            GroupName="y_lt_jegn" />
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body4">
                <div class="pay_body_main2_body_text">
                    帐号确认：</div>
                <div class="pay_body_main2_body_text_1_3">
                    <asp:TextBox ID="txtUserName_LT" runat="server" CssClass="help_textBox" Enabled="false"
                        ReadOnly="true" Font-Bold="true"></asp:TextBox>(请您确认要充值的帐号)
                </div>
            </div>
            <div class="pay_body_main2_body5">
                <asp:ImageButton ID="btnLT" runat="server" CssClass="div_button2" ImageUrl="../Images/SubPage/payCenterBtnOk.jpg"
                    OnClick="btnOK_Click" />
            </div>
            <div class="pay_body_main2_body6_shenzhou">
                支付说明：
                <p>
                    1、请务必使用与您选择的充值卡面额相同的卡进行充值。
                </p>
                <p>
                    2、支持联通全国卡，卡号15位，密码19位
                </p>
                <p>
                    3、支持面值30元、50元、100元充值卡。
                </p>
                <p>
                    <font color="red">注意：请务必使用与您选择的面额相同的联通充值卡进行支付，否则引起的交易失败交易金额不予退还。</font>如：选择50元面额但使用100元卡支付，则系统认为实际支付金额为50元，高于50元部分不予退还；选择50元面额但使用30元卡支付则系统认为支付失败，30元不予退还。
                </p>
            </div>
            <div class="pay_body_main2_body88_qita7">
                该充值方式兑换比率为：1元=8元宝=4000金币</div>
        </asp:Panel>
        <asp:Panel ID="pl_y_jw" runat="server" Visible="false">
            <div class="pay_body_main2_body1">
                <div class="yeepay_Title">
                    骏网一卡通充值
                </div>
                <div class="pay_body_main2_body_text">
                    购买物品：</div>
                <div class="pay_body_main2_body_text_1">
                    元宝</div>
            </div>
            <div class="pay_body_main2_body2_shenzhou">
                <div class="pay_body_main2_body_text2">
                    购买金额：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_jw_je10" runat="server" Text="充值10元卡,可获得75元宝(可兑换37500金币)"
                            GroupName="y_jw_jegn" /><br />
                        <asp:RadioButton ID="rb_y_jw_je15" runat="server" Text="充值15元卡,可获得112元宝(可兑换56000金币)"
                            GroupName="y_jw_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_jw_je30" runat="server" Text="充值30元卡,可获得225元宝(可兑换112500金币)"
                            GroupName="y_jw_jegn" /><br />
                        <asp:RadioButton ID="rb_y_jw_je50" runat="server" Text="充值50元卡可,获得375元宝(可兑换187500金币)"
                            GroupName="y_jw_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_jw_je100" runat="server" Text="充值100元卡,可获得750元宝(可兑换375000金币)"
                            GroupName="y_jw_jegn" />
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body4" style="top: 80px">
                <div class="pay_body_main2_body_text">
                    帐号确认：</div>
                <div class="pay_body_main2_body_text_1_3">
                    <asp:TextBox ID="txtUserName_JW" runat="server" CssClass="help_textBox" Enabled="false"
                        ReadOnly="true" Font-Bold="true"></asp:TextBox>(请您确认要充值的帐号)
                </div>
            </div>
            <div class="pay_body_main2_body5" style="top: 80px">
                <asp:ImageButton ID="btnJW" runat="server" CssClass="div_button2" ImageUrl="../Images/SubPage/payCenterBtnOk.jpg"
                    OnClick="btnOK_Click" />
            </div>
            <div class="pay_body_main2_body6_shenzhou" style="top: 80px">
                支付说明：
                <p>
                    1、支持卡种：卡号、密码都是16位数字。
                </p>
                <p>
                    2、支持面额：10元、15元、30元、50元、100元。
                </p>
                <p>
                    3、不能使用特定游戏专属充值卡支付。 特定游戏包括大唐风云、传说、蜗牛、猫扑一卡通、九鼎、雅典娜、山河等游戏。
                </p>
                <p>
                    4、在此使用过的一卡通，卡内剩余J点只能在易宝支付合作商家进行支付使用。如：您选择50元面额但使用100元卡支付，剩余的金额还在一卡通卡中，但是只能继续在我们网站的充值页面使用。
                </p>
                <p>
                    <font color="red">注意：请务必使用与您选择的面额相同或者大于充值金额的充值卡进行支付，否则引起的交易失败交易金额不予退还。</font>如：选择50元面额但使用30元卡支付则系统认为支付失败，30元不予退还。
                </p>
            </div>
            <div class="pay_body_main2_body88_qita1">
                该充值方式兑换比率为：1元=7.5元宝=3750金币</div>
        </asp:Panel>
        <asp:Panel ID="pl_y_sd" runat="server" Visible="false">
            <div class="pay_body_main2_body1">
                <div class="yeepay_Title">
                    盛大卡充值
                </div>
                <div class="pay_body_main2_body_text">
                    购买物品：</div>
                <div class="pay_body_main2_body_text_1">
                    元宝</div>
            </div>
            <div class="pay_body_main2_body88_qita2">
                <div class="pay_body_main2_body_text2">
                    购买金额：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_sd_je10" runat="server" Text="充值10元卡，可获得70元宝(可兑换35000金币)"
                            GroupName="y_sd_jegn" /><br />
                        <asp:RadioButton ID="rb_y_sd_je15" runat="server" Text="充值15元卡，可获得105元宝(可兑换52500金币)"
                            GroupName="y_sd_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_sd_je25" runat="server" Text="充值25元卡，可获得175元宝(可兑换87500金币)"
                            GroupName="y_sd_jegn" /><br />
                        <asp:RadioButton ID="rb_y_sd_je30" runat="server" Text="充值30元卡，可获得210元宝(可兑换105000金币)"
                            GroupName="y_sd_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_sd_je35" runat="server" Text="充值35元卡，可获得245元宝(可兑换122500金币)"
                            GroupName="y_sd_jegn" /><br />
                        <asp:RadioButton ID="rb_y_sd_je50" runat="server" Text="充值50元卡，可获得350元宝(可兑换175000金币)"
                            GroupName="y_sd_jegn" />
                    </div>
                    <div>
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_sd_je100" runat="server" Text="充值100元卡，可获得700元宝(可兑换350000金币)"
                            GroupName="y_sd_jegn" /><br />
                        <asp:RadioButton ID="rb_y_sd_je300" runat="server" Text="充值300元卡，可获得2100元宝(可兑换1050000金币)"
                            GroupName="y_sd_jegn" />
                    </div>
                    <div>
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body4" style="top: 120px">
                <div class="pay_body_main2_body_text">
                    帐号确认：</div>
                <div class="pay_body_main2_body_text_1_3">
                    <asp:TextBox ID="txtUserName_SD" runat="server" CssClass="help_textBox" Enabled="false"
                        ReadOnly="true" Font-Bold="true"></asp:TextBox>(请您确认要充值的帐号)
                </div>
            </div>
            <div class="pay_body_main2_body5" style="top: 120px">
                <asp:ImageButton ID="btnSD" runat="server" CssClass="div_button2" ImageUrl="../Images/SubPage/payCenterBtnOk.jpg"
                    OnClick="btnOK_Click" />
            </div>
            <div class="pay_body_main2_body6_shenzhou" style="top: 120px">
                支付说明：
                <p>
                    1、支持全国通用的盛大一卡通（卡号15位，密码8位）。
                </p>
                <p>
                    <font color="red">2、请务必使用与您所选择的面额相同的一卡通进行支付,否则引起的交易失败或交易金额丢失，我方不予承担！如：您选择10元面额但使用30元卡支付，则系统默认支付失败，不予退还。您选择30元面额但使用10元卡支付，则系统默认支付失败，不予退还。</font>
                </p>
            </div>
            <div class="pay_body_main2_body88_qita3" style="top: 500px">
                该充值方式兑换比率为：1元=7元宝=3500金币</div>
        </asp:Panel>
        <asp:Panel ID="pl_y_zt" runat="server" Visible="false">
            <div class="pay_body_main2_body1">
                <div class="yeepay_Title">
                    征途卡充值
                </div>
                <div class="pay_body_main2_body_text">
                    购买物品：</div>
                <div class="pay_body_main2_body_text_1">
                    元宝</div>
            </div>
            <div class="pay_body_main2_body2_shenzhou">
                <div class="pay_body_main2_body_text2">
                    购买金额：</div>
                <div class="pay_body_main2_body_text_2">
                    <div>
                        <asp:RadioButton ID="rb_y_zt_je10" runat="server" Text="充值10元卡，可获得70元宝(可兑换35000金币)"
                            GroupName="y_zt_jegn" /><br />
                        <asp:RadioButton ID="rb_y_zt_je15" runat="server" Text="充值15元卡，可获得105元宝(可兑换52500金币)"
                            GroupName="y_zt_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_zt_je25" runat="server" Text="充值25元卡，可获得175元宝(可兑换87500金币)"
                            GroupName="y_zt_jegn" /><br />
                        <asp:RadioButton ID="rb_y_zt_je30" runat="server" Text="充值30元卡，可获得210元宝(可兑换105000金币)"
                            GroupName="y_zt_jegn" />
                    </div>
                    <div>
                        <asp:RadioButton ID="rb_y_zt_je50" runat="server" Text="充值50元卡，可获得350元宝(可兑换175000金币)"
                            GroupName="y_zt_jegn" /><br />
                        <asp:RadioButton ID="rb_y_zt_je100" runat="server" Text="充值100元卡，可获得700元宝(可兑换350000金币)"
                            GroupName="y_zt_jegn" />
                    </div>
                </div>
            </div>
            <div class="pay_body_main2_body4" style="top: 80px">
                <div class="pay_body_main2_body_text">
                    帐号确认：</div>
                <div class="pay_body_main2_body_text_1_3">
                    <asp:TextBox ID="txtUserName_ZT" runat="server" CssClass="help_textBox" Enabled="false"
                        ReadOnly="true" Font-Bold="true"></asp:TextBox>(请您确认要充值的帐号)
                </div>
            </div>
            <div class="pay_body_main2_body5" style="top: 80px">
                <asp:ImageButton ID="btnZT" runat="server" CssClass="div_button2" ImageUrl="../Images/SubPage/payCenterBtnOk.jpg"
                    OnClick="btnOK_Click" />
            </div>
            <div class="pay_body_main2_body6_shenzhou" style="top: 80px">
                支付说明：
                <p>
                    1、支持卡种：全国官方征途游戏充值卡，卡号16位，密码8位。
                </p>
                <p>
                    2、支持面值：10元、15元、25元、30元、50元、100元。
                </p>
                <p>
                    <font color="red">注意：请务必使用与您选择的面额相同的充值卡进行支付，否则引起的交易失败交易金额不予退还。如选择50元面额但使用30元卡支付则系统认为支付失败，30元不予退还。
                    </font>
                </p>
            </div>
            <div class="pay_body_main2_body88_qita6">
                该充值方式兑换比率为：1元=7元宝=3500金币</div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
