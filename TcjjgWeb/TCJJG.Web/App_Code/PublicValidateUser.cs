using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;
using TCJJG.Web.Biz;
using Static.Common.Operation;

/// <summary>
///后台验证用户类
/// </summary>
public static class PublicValidateUser
{
    /// <summary>
    /// 后台验证帐号(注册)
    /// </summary>
    /// <param name="userName"></param>
    /// <returns></returns>
    public static bool UserNameRegValidate(string userName)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(userName))
        {
            int i = CommonOperation.GetStringLength(userName.Trim());
            //string regex = @"^[A-Za-z\u4e00-\u9fa5][\w\u4e00-\u9fa5]*$"; //以字母汉字开头的字母汉字数字或下划线组成的帐号
            string regex = @"^[\w\u4e00-\u9fa5]*$"; //字母汉字数字或下划线组成的帐号
            if (i >= 4 && i <= 15 && Regex.IsMatch(userName, regex))
            {
                returnValue = true;
            }
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证密码(MD5形式)
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    public static bool PasswordValidate_MD5(string password)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(password))
        {
            if (password.Length > 20 && password.Length < 64)
            {
                returnValue = true;
            }
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证密码(非MD5形式)
    /// </summary>
    /// <param name="password"></param>
    /// <returns></returns>
    public static bool PasswordValidate(string password)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(password))
        {
            if (password.Length > 5 && password.Length < 21)
            {
                returnValue = true;
            }
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证昵称正则验证
    /// </summary>
    /// <param name="nickName"></param>
    /// <returns></returns>
    public static bool NickNameValidate(string nickName)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(nickName))
        {
            int i = CommonOperation.GetStringLength(nickName.Trim());
            //string regex = @"^[A-Za-z\u4e00-\u9fa5][\w\u4e00-\u9fa5]*$"; //以字母汉字开头的字母汉字数字或下划线组成的帐号
            string regex = @"^[\w\u4e00-\u9fa5]*$"; //字母汉字数字或下划线组成的帐号
            if (i >= 4 && i <= 15 && Regex.IsMatch(nickName.Trim(), regex))
            {
                returnValue = true;
            }
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证过滤词语
    /// </summary>
    /// <param name="wordsValidate"></param>
    /// <returns></returns>
    public static bool FiltrateWordsValidate(string wordsValidate)
    {
        if (string.IsNullOrEmpty(wordsValidate)) return false;
        bool returnValue = true;
        int? num = 0;
        WSClient.ResourceWS().FiltrateWordsVerify(wordsValidate, ref num);
            if (num < 0)
            {
                returnValue = false;
            }
        return returnValue;
    }

    ///// <summary>
    ///// 后台验证过滤词语
    ///// </summary>
    ///// <param name="wordsValidate"></param>
    ///// <returns></returns>
    //public static bool FiltrateWordsValidate(string wordsValidate)
    //{
    //    if (string.IsNullOrEmpty(wordsValidate)) return false;
    //    bool returnValue = true;
    //    wordsValidate = wordsValidate.ToLower();
    //    //获取过滤列表
    //    string[] filtrateWords = WebCommon.GetFiltrateWords();
    //    for (int j = 0; j < filtrateWords.Length; j++)
    //    {
    //        if (wordsValidate.IndexOf(filtrateWords[j]) > -1)
    //        {
    //            returnValue = false;
    //            break;
    //        }
    //    }
    //    return returnValue;
    //}

    /// <summary>
    /// email验证
    /// </summary>
    /// <param name="email"></param>
    /// <returns></returns>
    public static bool EmailValidate(string email)
    {
        bool returnValue = false;
        string regex = @"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
        if (!string.IsNullOrEmpty(email) && Regex.IsMatch(email, regex))
        {
            if (email.Length <= 60)
            {
                returnValue = true;
            }
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证帐号(登录)
    /// 1.不为空，小于等于20 2.不包括过滤词语验证
    /// </summary>
    /// <param name="userID"></param>
    /// <returns></returns>
    public static bool UserNameLoginValidate(string userName)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(userName))
        {
            int i = CommonOperation.GetStringLength(userName);
            if (i <= 20)
            {
                returnValue = true;
            }
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证固定电话
    /// </summary>
    /// <param name="phone"></param>
    /// <returns></returns>
    public static bool PhoneValidate(string phone)
    {
        bool returnValue = false;
        string regex = "^[0-9]*$";
        if (!string.IsNullOrEmpty(phone) && phone.Length <= 20 && Regex.IsMatch(phone, regex))// 是否是数字
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证移动电话
    /// </summary>
    /// <param name="movephone"></param>
    /// <returns></returns>
    public static bool MovePhoneValidate(string movephone)
    {
        bool returnValue = false;
        string regex = "^[0-9]*$";
        if (!string.IsNullOrEmpty(movephone) && movephone.Length <= 20 && Regex.IsMatch(movephone, regex))// 是否是数字
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证身份证
    /// </summary>
    /// <param name="idCard"></param>
    /// <returns></returns>
    public static bool IDCardValidate(string idCard)
    {
        bool returnValue = false;
        string regex = @"^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$";
        if (!string.IsNullOrEmpty(idCard) && Regex.IsMatch(idCard, regex))
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证邮编
    /// </summary>
    /// <param name="postNumber"></param>
    /// <returns></returns>
    public static bool PostNumberValidate(string postNumber)
    {
        bool returnValue = false;
        string regex = @"^[0-9]\d{5}$";
        if (!string.IsNullOrEmpty(postNumber) && Regex.IsMatch(postNumber, regex))
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证地址
    /// </summary>
    /// <param name="address"></param>
    /// <returns></returns>
    public static bool AddressValidate(string address)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(address) && CommonOperation.GetStringLength(address) <= 120)
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证联系人
    /// </summary>
    /// <param name="recipient"></param>
    /// <returns></returns>
    public static bool RecipientValidate(string recipient)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(recipient) && CommonOperation.GetStringLength(recipient) <= 30)
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证用户提问
    /// </summary>
    /// <param name="askContents"></param>
    /// <returns></returns>
    public static bool AskValidate(string askContents)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(askContents) && CommonOperation.GetStringLength(askContents) <= 200)
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证QQ
    /// </summary>
    /// <param name="qq"></param>
    /// <returns></returns>
    public static bool QQValidate(string qq)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(qq) && qq.Length < 20)
        {
            returnValue = true;
        }
        return returnValue;
    }
    /// <summary>
    /// 后台验证备注
    /// </summary>
    /// <param name="remarks"></param>
    /// <returns></returns>
    public static bool RemarksValidate(string remarks)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(remarks) && remarks.Length < 60)
        {
            returnValue = true;
        }
        return returnValue;
    }

    /// <summary>
    /// 后台验证密码找回回答
    /// </summary>
    /// <param name="answer"></param>
    /// <returns></returns>
    public static bool AnswerValidate(string answer)
    {
        bool returnValue = false;
        if (!string.IsNullOrEmpty(answer) && answer.Length < 64)
        {
            returnValue = true;
        }
        return returnValue;
    }
}