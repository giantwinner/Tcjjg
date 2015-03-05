using System;
using System.Collections.Generic;
using TCJJG.Web.Model;
using TCJJG.Web.DB;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;

public partial class RequestWebservice_User_ReckoningAmply : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Request.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        //parameter
        string sit = Request.QueryString.Get("it");
        string ssu = Request.QueryString.Get("su");
        string sid = Request.QueryString.Get("id");
        string sma = Request.QueryString.Get("ma");
        //
        string strXML = string.Empty;
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        if (null == user || !CommonOperation.IsNumInt32(ssu) || !CommonOperation.IsNumInt32(sma)) return;
        //
        int it = Convert.ToInt32(sit);
        int su = Convert.ToInt32(ssu);
        int ma = Convert.ToInt32(sma);
        //
        Guid rid = Guid.Empty;
        try
        {
            rid = new Guid(sid);
        }
        catch (Exception)
        {
        }
        if (rid == Guid.Empty) return;
        //
        if ((it == 4 && su == 6) || (it == 4 && su == 0) || (it == 4 && su == 10) || (it == 3 && su == 1))
        {
            strXML = UserCenter.UserAcount().UserReckoningSelAmply(user.UserID, rid);
            Response.Write("<response>" + strXML + "</response>");
            Response.End();
        }
        //else if (it == 4)
        //{
        //    WebDataDataContext cl = new WebDataDataContext();
        //    Response.Write("<response>" + op100(user.UserID, ma, cl) + "</response>");
        //    Response.End();
        //}
        //else if (it == 3)
        //{
        //    WebDataDataContext cl = new WebDataDataContext();
        //    if (su == 8 || su == 13)
        //    {
        //        strXML = op201(user.UserID, ma, cl);
        //    }
        //    else if (su == 9 || su == 12)
        //    {
        //        strXML = op202(user.UserID, ma, cl);
        //    }
        //    Response.Write("<response>" + strXML + "</response>");
        //    Response.End();
        //}
        else
        {
            strXML = UserCenter.UserAcount().UserReckoningSelAmply(user.UserID, rid);
            Response.Write("<response>" + strXML + "</response>");
            Response.End();
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="userID"></param>
    /// <param name="id"></param>
    /// <param name="cl"></param>
    /// <returns></returns>
    //private string op100(Guid userID, int logid, WebDataDataContext cl)
    //{
    //    var data = cl.FWP_ClaimLog_SelAdd(userID, logid);
    //    List<ClaimLog> listClaimLog = new List<ClaimLog>();
    //    List<ClaimLogAdd> listClaimLogAdd = new List<ClaimLogAdd>();
    //    foreach (var item in data)
    //    {
    //        ClaimLog c = new ClaimLog();
    //        c.AN = item.AwardName;
    //        c.AC = item.AwardCount;
    //        c.AT = item.AccountType;
    //        c.CCTN = string.IsNullOrEmpty(item.ClaimCredentialTypeName) ? "兑奖" : item.ClaimCredentialTypeName;
    //        c.AB = item.AwardBonus;
    //        c.AS = item.ClaimStatusName;
    //        c.CR = item.CreateDate.ToString();
    //        c.OT = item.opeType;
    //        c.MN = string.IsNullOrEmpty(item.MatchName) ? "--" : item.MatchName;
    //        listClaimLog.Add(c);
    //        //
    //        ClaimLogAdd ca = new ClaimLogAdd();
    //        ca.A = string.IsNullOrEmpty(item.Address) ? "-1" : item.Address;
    //        ca.E = string.IsNullOrEmpty(item.Email) ? "-1" : item.Email;
    //        ca.M = string.IsNullOrEmpty(item.MovePhone) ? "-1" : item.MovePhone;
    //        ca.N = string.IsNullOrEmpty(item.PostNumber) ? "-1" : item.PostNumber;
    //        ca.T = string.IsNullOrEmpty(item.Recipient) ? "-1" : item.Recipient;
    //        ca.Q = string.IsNullOrEmpty(item.QQ) ? "-1" : item.QQ;
    //        ca.R = string.IsNullOrEmpty(item.Remarks) ? "-1" : item.Remarks;
    //        listClaimLogAdd.Add(ca);
    //    }
    //    string strXML1 = string.Empty;
    //    string strXML2 = string.Empty;
    //    if (listClaimLog.Count > 0)
    //        strXML1 = SerializeObject.SerializeListObjToXML(listClaimLog);
    //    if (listClaimLogAdd.Count > 0)
    //        strXML2 = SerializeObject.SerializeListObjToXML(listClaimLogAdd);
    //    return strXML1 + strXML2;
    //}

    ///// <summary>
    ///// 
    ///// </summary>
    ///// <param name="userID"></param>
    ///// <param name="id"></param>
    ///// <param name="cl"></param>
    ///// <returns></returns>
    //private string op201(Guid userID, int logid, WebDataDataContext cl)
    //{
    //    string str = string.Empty;
    //    var data = cl.FWP_Card3(userID, logid);
    //    List<PC> l = new List<PC>();
    //    foreach (var item in data)
    //    {
    //        PC p = new PC();
    //        p.CA = item.CardID;
    //        p.PA = item.P_Amount;
    //        p.CT = item.C_TypeID;
    //        p.CAM = item.C_Amount;
    //        p.U1 = item.UserName1;
    //        p.U2 = item.UserName2;
    //        p.CR = item.CreateDate.ToString();
    //        p.CI = item.CreateIP;
    //        p.RE = item.Remarks;
    //        p.CS = item.CardState.Value;
    //        p.AB = item.AbateDate.ToString();
    //        l.Add(p);
    //    }
    //    if (l.Count > 0)
    //        str = SerializeObject.SerializeListObjToXML(l);
    //    return str;
    //}

    ///// <summary>
    ///// 
    ///// </summary>
    ///// <param name="userID"></param>
    ///// <param name="id"></param>
    ///// <param name="cl"></param>
    ///// <returns></returns>
    //private string op202(Guid userID, int logid, WebDataDataContext cl)
    //{
    //    string str = string.Empty;
    //    var data = cl.FWP_YeepayLog3(userID, logid);
    //    List<PY> l = new List<PY>();
    //    foreach (var item in data)
    //    {
    //        PY p = new PY();
    //        p.U1 = item.UserName1;
    //        p.U2 = item.UserName2;
    //        p.TY = item.TypeID;
    //        p.AM = item.Amount;
    //        p.ST = item.Status;
    //        p.CR = item.CreateTime.ToString();
    //        p.CI = item.CreateIP;
    //        p.RE = item.Remark;
    //        p.CA = item.CallBackTime.ToString();
    //        p.YB = item.YBankName;
    //        p.LN = item.LnterestRateValue.Value;
    //        l.Add(p);
    //    }
    //    if (l.Count > 0)
    //        str = SerializeObject.SerializeListObjToXML(l);
    //    return str;
    //}

}
