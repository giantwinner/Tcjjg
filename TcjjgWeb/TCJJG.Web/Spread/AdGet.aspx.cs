using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using System.Xml.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;

public partial class Spread_AdGet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string channelNum = Convert.ToString(Request.QueryString["spread"]);
        string userName = Convert.ToString(Request.QueryString["idCode"]);

        string merid = Convert.ToString(Request.QueryString["merid"]);
        string keycode = Convert.ToString(Request.QueryString["keycode"]);

        #region 蹦蹦网

        if (!string.IsNullOrEmpty(channelNum) && !string.IsNullOrEmpty(userName))
        {
            if (CommonOperation.IsNumInt32(channelNum))
            {
                try
                {
                    var data = WSClient.SpreadWS().GetUserInfoForAdPartner(userName, Convert.ToInt32(channelNum));
                    if (null != data)
                    {
                        Result result = new Result();
                        result.Status = "1";
                        result.UserID = data.UserName;
                        result.UserName = data.UserName;
                        result.UserServer = "";
                        result.UserRole = "0";
                        result.UserLevel = Convert.ToString(data.Rank);
                        result.ChongZhi = "0";
                        result.ServerName = "";
                        Response.Write(ObjectToJson<Result>(result, Encoding.UTF8));
                    }
                    else
                    {
                        Result result = new Result();
                        result.Status = "";
                        result.UserID = "";
                        result.UserName = "";
                        result.UserServer = "";
                        result.UserRole = "";
                        result.UserLevel = "";
                        result.ChongZhi = "";
                        result.ServerName = "";
                        Response.Write(ObjectToJson<Result>(result, Encoding.UTF8));
                    }
                }
                catch (Exception ex)
                {
                    Result result = new Result();
                    result.Status = "-1";
                    result.UserID = "";
                    result.UserName = "";
                    result.UserServer = "";
                    result.UserRole = "";
                    result.UserLevel = "";
                    result.ChongZhi = "";
                    result.ServerName = "";
                    Response.Write(ObjectToJson<Result>(result, Encoding.UTF8));
                    FFJJG.Server.Utils.Logging.write(ex);
                }
            }
            return;
        }
        #endregion

        #region PC蛋蛋

        StringBuilder sb = new StringBuilder();
        if (!string.IsNullOrEmpty(channelNum) && !string.IsNullOrEmpty(merid) && !string.IsNullOrEmpty(keycode))
        {

            if (CommonOperation.IsNumInt32(channelNum))
            {
                try
                {
                    string key = merid + WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/Pceggs/key");
                    key = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(key, "MD5").ToLower();

                    if (keycode!=key)
                    {
                        sb.Append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>");
                        sb.Append("<Result>");
                        sb.Append("<ErrMsg>验证失败</ErrMsg>");
                        sb.Append("<Status>-1</Status>");
                        sb.Append("</Result>");

                        Response.Write(sb.ToString());
                        return;
                    }

                    var data = WSClient.SpreadWS().GetUserInfoForAdPartner(merid, Convert.ToInt32(channelNum));
                    if (null != data)
                    {
                        sb.Append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>");
                        sb.Append("<Result>");
                        sb.Append("<GameName>" + data.UserName + "</GameName>");
                        sb.Append("<PlayLevel>" + data.MatchCount + "</PlayLevel>");
                        sb.Append("<TodayLevel>" + data.IsNextDayVisit + "</TodayLevel>");
                        sb.Append("<Status>1</Status>");
                        sb.Append("</Result>");

                        Response.Write(sb.ToString());
                    }
                    else 
                    {
                        sb.Append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>");
                        sb.Append("<Result>");
                        sb.Append("<ErrMsg>账号不存在</ErrMsg>");
                        sb.Append("<Status>-1</Status>");
                        sb.Append("</Result>");

                        Response.Write(sb.ToString());
                    }
                }
                catch (Exception ex)
                {
                    sb.Append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>");
                    sb.Append("<Result>");
                    sb.Append("<ErrMsg>接口异常</ErrMsg>");
                    sb.Append("<Status>-1</Status>");
                    sb.Append("</Result>");

                    Response.Write(sb.ToString());

                    FFJJG.Server.Utils.Logging.write(ex);
                }
            }
        }
        #endregion
    }




    public string ObjectToJson<T>(Object jsonObject, Encoding encoding)
    {
        string result = String.Empty;
        DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(T));
        using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
        {
            serializer.WriteObject(ms, jsonObject);
            result = encoding.GetString(ms.ToArray());
            result = "{\"Result\":" + result + "}";
        }
        return result;
    }

}