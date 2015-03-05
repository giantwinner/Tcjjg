using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;

public partial class PayCenter_VpayReceive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string spid = "11525"; //'sp号码
        string sppwd = "290891530071936242"; //'sp18位密码

        //'接受服务器url get参数                            
        string rtmd5 = Request.QueryString["v1"]; //   '服务器MD5 
        string trka = Request.QueryString["v2"];  //  'V币号码15位
        string rtmi = Request.QueryString["v3"]; //   '密码'V币密码6位 （可能为空 老V币没有密码）
        string rtmz = Request.QueryString["v4"];    //  '面值1-999 整数
        string rtlx = Request.QueryString["v5"];    //  '卡的类型  1 2 3 
        string rtoid = Request.QueryString["v6"]; // '网盈一号通服务器端订单 
        string rtcoid = Request.QueryString["v7"];  //  '商户自己订单
        string rtuserid = Request.QueryString["v8"];// '商户的用户ID 
        string rtcustom = Request.QueryString["v9"]; //'商户自己定义数据
        string rtflag = Request.QueryString["v10"]; // '返回状态. 1正常发送 2补单发送



        string get_key = trka + rtmi + rtoid + spid + sppwd + rtcoid + rtflag + rtmz;
        //'卡+密+网盈一号通服务器端订单+ 5位spid+ 18位SP密码+商户订单+rtflag返回类型1或2 +面值
        //'LCase函数是将字符转换为小写; Ucase函数是将字符转换为大写
        //'全国声讯支付联盟全国声讯电话支付接口对MD5值只认大写字符串，所以小写的MD5值得转换为大写
        string md5password = md5(get_key, 32);   //  '先MD5 32 然后转大写


        //'流程 第1次访问此页面 是盈华讯方服务器调用此页面1次 ，你先判断订单（订单包含金额，面值，状态等消息）
        //'如果订单是没有使用状态并金额一致就MD5校验，校验通过 你发送“header("Data-Received:ok_vpay8"); ”
        //'给盈华讯方服务器，服务器接收到这个头 后判断（ 你已经给用户加点了)，然后就把本页面转向给你
        //，此时转发的数据和第一次服务器直接调用的一致 此次你只需要根据订单，给用户提示冲值成功就可以了。
        //如果你没有发送头或网络中断，我就会给用户提示补单的消息（他可以自己点击，也可以我方服务器自动
        //补发，补发数据的MD5和第一发送的不一样，里面的“$_GET['v10']”'返回状态. 1为正常发送回来 2为补单发送回来）
        // 做好加点后一定要把订单 状态改变。！并注意安全处理。  
        //关于订单安全做法 如有不明请电话：0755-82126136 徐先生 

        //此页面不要使用SEESION cooke  请用数据库管理你的订单 */
        //////////此处请商户自己编写求出订单状态代码 以备下方条件判断用！


        //'步骤1  :包含A和B
        //'A步骤,盈华讯方服务器第一次探测商户服务器状态.并给该订单充值 
        //'B步骤,检查该订单如果订单使用了 就把该订单的充值记录给用户打印.

        string userName = "";
        int? payAmount = 0;
        int? GetRichType = 0;
        int? GetRichAmount = 0;
        PaySvcClient pay = new PaySvcClient();
        int reNum = 1;
        string ip = rtcustom.Replace("n",".");
        try
        {
            reNum = pay.VpayCallBack(Convert.ToInt32(rtcoid), Convert.ToInt32(rtmz), rtoid, "VPay", DateTime.Now.ToString(), trka, ref userName, ref payAmount, ref GetRichType, ref GetRichAmount);

            if (rtflag == "1")
            {
                if (md5password == rtmd5)
                {
                    //'校验商户订单号码状态 

                    //伪代码请根据自己的需求编写！

                    if (reNum == 1) //检查数据库 商户订单号码没有使用
                    {

                        //'此处商户方要校验数据库订单的面值与盈华服务器返回订单的面值需要相等。
                        // '前端客户网站禁止修改商户订单面值和一个订单可以匹配多个面值

                        //'给用户加上相应的服务。

                        int gameID = 0;
                        int item = 3;
                        SubItem subItem = SubItem.siFill;
                        string matchName = string.Empty;
                        RichDirection direction = RichDirection.rdIn;
                        string memo = "声讯电话充值 " + payAmount.Value + "V币";
                        string key = string.Empty;
                        int costRelationType = 0;
                        int matchID = 0;
                        int matchNum = 0;

                        List<AcountInfo> ls = new List<AcountInfo>();
                        AcountInfo a = new AcountInfo();
                        a.A = GetRichAmount.Value;
                        a.T = GetRichType.Value;
                        a.N = "元宝";
                        ls.Add(a);

                        Guid userID = UserCenter.UserInfo().GetUserIDByUserName(userName,0);
                        int ret = UserCenter.UserAcount().UpdateAcount(gameID, item, subItem, matchName, memo, direction, userID, ls.ToArray(), costRelationType, key, matchID, matchNum);
                        if (ret < 0)
                        {
                            Response.Redirect("/paycenter/payresult.aspx?r1=2");
                        }
                        else
                        {
                            RichInfoSvcClient rc = new RichInfoSvcClient();
                            rc.PayLogAdd(21, userName, userName, payAmount.Value, GetRichType.Value, GetRichAmount.Value, ip, "");
                        }

                        //'数据库按照订单加服务

                        //'修改订单为使用状态.
                        Response.AddHeader("Data-Received", "ok_vpay8");// '此句不能删除也不能修改，作为探测成功之用

                    }
                    //伪代码请根据自己的需求编写！
                    else if (reNum == 2) //检查数据库 商户订单号码已经使用
                    { //'B步骤
                        //'此处根据已用的订单显示用户充值信息.
                        //'这里显示用户充值的信息。如充值多少元，加上什么服务等。



                        Response.AddHeader("Data-Received", "ok_vpay8");// '此句不能删除也不能修改，作为探测成功之用
                        Response.Redirect("/paycenter/payresult.aspx?r1=1");
                    }

                    else //检查数据库 商户订单不存在或其他未知状态
                    {
                        Response.Redirect("/paycenter/payresult.aspx?r1=2");
                    }

                }

            }


            //'步骤2  :包含A补单
            //'A补单：如果由于网络服务器中断或加点失败,会在5分钟内开始给用户补发数据.持续200次 24个小时
            if (rtflag == "2")
            {
                if (md5password == rtmd5)
                {
                    //伪代码请根据自己的需求编写！
                    if (reNum == 1) //检查数据库 商户订单号码没有使用
                    {

                        //'此处商户方要校验数据库订单的面值与盈华服务器返回订单的面值需要相等。
                        // '前端客户网站禁止修改商户订单面值和一个订单可以匹配多个面值

                        //'给用户加上相应的服务。

                        int gameID = 0;
                        int item = 3;
                        SubItem subItem = SubItem.siFill;
                        string matchName = string.Empty;
                        RichDirection direction = RichDirection.rdIn;
                        string memo = "声讯电话充值&nbsp;" + payAmount.Value + "V币";
                        string key = string.Empty;
                        int costRelationType = 0;
                        int matchID = 0;
                        int matchNum = 0;

                        List<AcountInfo> ls = new List<AcountInfo>();
                        AcountInfo a = new AcountInfo();
                        a.A = GetRichAmount.Value;
                        a.T = GetRichType.Value;
                        a.N = "金币";
                        ls.Add(a);

                        Guid userID = UserCenter.UserInfo().GetUserIDByUserName(userName,0);
                        int ret = UserCenter.UserAcount().UpdateAcount(gameID, item, subItem, matchName, memo, direction, userID, ls.ToArray(), costRelationType, key, matchID, matchNum);
                        if (ret < 0)
                        {
                            Response.Redirect("/paycenter/payresult.html?r1=2");
                        }
                        else
                        {
                            RichInfoSvcClient rc = new RichInfoSvcClient();
                            rc.PayLogAdd(21, userName, userName, payAmount.Value, GetRichType.Value, GetRichAmount.Value, CommonOperation.GetIP4Address(), "");
                        }

                        //'数据库按照订单加服务

                        //'修改订单为使用状态.
                        Response.AddHeader("Data-Received", "ok_vpay8");// '此句不能删除也不能修改，作为探测成功之用

                    }

                    //伪代码请根据自己的需求编写！
                    else if (reNum == 2) //检查数据库 商户订单号码已经使用
                    {


                        //   '为了安全要继续校验订单号码是否已经使用 
                        //给出已经加点成功提示 

                        Response.AddHeader("Data-Received", "ok_vpay8");//	' 发送此句。我就不会给该订单补发数据了。
                        Response.Redirect("/paycenter/payresult.html?r1=1");
                    }

                    else //检查数据库 商户订单不存在或其他未知状态
                    {
                        Response.Redirect("/paycenter/payresult.html?r1=2");
                    }

                }



            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "|" + ex.StackTrace);
        }
    }

    public string md5(string str, int code)
    {
        if (code == 16) //16位MD5加密（取32位加密的9~25字符） 
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToUpper().Substring(8, 16);
        }
        else//32位加密 
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToUpper();
        }
    }


}




