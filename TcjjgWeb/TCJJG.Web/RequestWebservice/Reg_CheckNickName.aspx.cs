using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using System.Text;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;

public partial class ajax_Reg_CheckNickName : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Byte[] bytes = Request.BinaryRead(Request.ContentLength);
        NameValueCollection req = CommonOperation.FillFromEncodedBytes(bytes, Encoding.UTF8);
        //返回值 等于1昵称正常，等于-1昵称中有系统屏蔽字，等于-2正则失败，等于-3昵称重复
        int msg = 1;
        string nickName = req.Get("n");
        //int appid = 0;
        string error = string.Empty;
        int tmerr=0;
        //正则验证
        if (!PublicValidateUser.NickNameValidate(nickName))
        {
            msg = -2;
        }
        else
        {
            nickName = nickName.Trim().ToLower();
            if (!PublicValidateUser.FiltrateWordsValidate(nickName))
            {
                msg = -1;
            }
            else if (UserCenter.UserInfo().IsNickNameDuplicated(nickName, ref tmerr))//(appid, nickName))
            {
                msg = -3;
            }
        }
        Response.Write("<response><mu>" + msg + "</mu></response>");
    }
}
