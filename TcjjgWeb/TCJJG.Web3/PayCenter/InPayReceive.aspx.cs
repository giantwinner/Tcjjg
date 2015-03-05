using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Static.Common.Operation;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class PayCenter_InPayReceive : System.Web.UI.Page
{

    public string sp;      //商户代码
    public string sppwd;   //加密串
    public string od;      //订单号
    public string mz;      //金额
    public string spzdy;   //自定义数据
    public string md5;     //md5
    public string oid;     //盈华讯方平台订单号
    public string spreq;   //商户网站请求地址
    public string spsuc;   //商户端显示成功充值地址
    public string uName;

    protected void Page_Load(object sender, EventArgs e)
    {
        sp = "30054";
        sppwd = "kpwshundopdrekiugu";

        //接受服务器url get参数 
        od = Request.QueryString["sporder"];
        mz = Request.QueryString["mz"];
        spzdy = Request.QueryString["zdy"];
        uName = Request.QueryString["spuid"];
        oid = Request.QueryString["oid"];
        md5 = Request.QueryString["md5"];
        string ip = spzdy.Replace("n", ".");

        string md5Str = oid + od + sp + mz + sppwd;
        string md5password = MD5(md5Str, 32);

        string userName = "";
        int? payAmount = 0;
        int? GetRichType = 0;
        int? GetRichAmount = 0;
        PaySvcClient pay = new PaySvcClient();
        int reNum = 0;

        try
        {
            reNum = pay.VpayCallBack(Convert.ToInt32(od), Convert.ToInt32(mz), oid, "InPay", DateTime.Now.ToString(), "", ref userName, ref payAmount, ref GetRichType, ref GetRichAmount);

            if (md5password == md5)
            {

                if (reNum == 1) //检查数据库 商户订单号码未使用
                {
                    int gameID = 0;
                    int item = 3;
                    SubItem subItem = SubItem.siFill;
                    string matchName = string.Empty;
                    RichDirection direction = RichDirection.rdIn;
                    string memo = "手机短信充值 " + payAmount.Value + "元";
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
                        Response.Write("failydzf");
                    }
                    else
                    {
                        RichInfoSvcClient rc = new RichInfoSvcClient();
                        rc.PayLogAdd(22, userName, userName, payAmount.Value, GetRichType.Value, GetRichAmount.Value, CommonOperation.GetIP4Address(), "");
                    }

                    //'修改订单为使用状态.
                    Response.Write("okydzf");
                }


                else if (reNum == 2) //检查数据库 商户订单号码已经使用
                {
                    Response.Write("okydzf");
                }

                else //检查数据库 商户订单不存在或其他未知状态
                {
                    Response.Write("failydzf");
                }

            }

            else
            {
                Response.Write("failydzf");
            }
           

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message + "|" + ex.StackTrace);
            Response.Write("failydzf");
        }
    }

    //md5
    public string MD5(string str, int code)
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