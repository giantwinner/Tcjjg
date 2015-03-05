using System;
using System.Collections.Specialized;
using System.Text;
using Static.Common.Operation;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class RequestWebservice_User_ChangeUserInfoAmply : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Byte[] bytes = Request.BinaryRead(Request.ContentLength);
        NameValueCollection req = CommonOperation.FillFromEncodedBytes(bytes, Encoding.UTF8);
        //返回值
        int i = -800;
        //参数
        string ty = string.IsNullOrEmpty(req.Get("ty")) ? "1" : req.Get("ty");
        string recipient = string.Empty;
        string email = string.Empty;
        string movePhone = string.Empty;  //
        string address = string.Empty;
        string postNumber = string.Empty;
        string nickName = string.Empty;
        string phone = string.Empty;   //
        string idCard = string.Empty;  //
        string QQ = string.Empty;      //
        string msn = string.Empty;     //

        string ps = req.Get("ps");

        if (ty == "1") //update user award address
        {
            recipient = req.Get("r");
            email = req.Get("e");
            address = req.Get("a");
            postNumber = req.Get("n");
        }
        else //udate user nickName
        {
            nickName = req.Get("u");
        }
        //
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        if (user == null || user.Password != ps)
        {
            i = -900;//原始密码错误
        }
        else
        {
            //后台正则验证
            bool isNickName = true;
            if (!PublicValidateUser.NickNameValidate(nickName) || !PublicValidateUser.FiltrateWordsValidate(nickName)) { isNickName = false; }
            else { nickName = nickName.ToLower(); }
            //
            if (!string.IsNullOrEmpty(email)) email = email.Trim().ToLower();
            bool isEmail = true;
            if (!PublicValidateUser.EmailValidate(email)) { isEmail = false; }
            bool isRecipient = true;
            if (!PublicValidateUser.RecipientValidate(recipient)) { isRecipient = false; }
            bool isAddress = true;
            if (!PublicValidateUser.AddressValidate(address)) { isAddress = false; }
            bool isPostNumber = true;
            if (!PublicValidateUser.PostNumberValidate(postNumber)) { isPostNumber = false; }

            //webservice添加新数据
            if (ty == "1")
            {
                if (isPostNumber && isEmail && isAddress && isRecipient)
                {

                    string error = string.Empty;
                    bool ope = UserCenter.UserInfo().F_ChangeUserInfoAmply(user.UserID, email.ToLower(), movePhone, phone, idCard, recipient, postNumber, address, QQ, msn, 1, "", "", "2000-01-01");
                    //return true 更新成功，return false 更新失败（不存在该用户）ref -412
                    if (ope)
                    {
                        i = 9001;
                    }
                    else
                    {
                        i = -2;// data exception
                    }
                }
                else
                {
                    i = -800;//正则失败
                }
            }
            else
            {
                if (isNickName)
                {
                    string error = string.Empty;
                    int ope = UserCenter.UserInfo().UpdateNickName(user.UserID, nickName);
                    if (ope>=0)
                    {
                        i = 900;
                        user.NickName = nickName;
                    }
                    else
                    {
                        i = -2;// data exception
                    }
                }
                else
                {
                    i = -800;//正则失败
                }
            }
        }
        Response.Write("<response><ms>" + i + "</ms></response>");
        Response.End();
    }
}
