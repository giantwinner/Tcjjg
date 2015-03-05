using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Security;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.IO;

//zhangsw 2013年6月1日 14:29:16
//
/*    
 * 作者：周公(zhoufoxcn)    
 * 日期：2011-05-08    
 * 原文出处：http://blog.csdn.net/zhoufoxcn 或http://zhoufoxcn.blog.51cto.com    
 * 版权说明：本文可以在保留原文出处的情况下使用于非商业用途，周公对此不作任何担保或承诺。    
 * */

/// <summary>
///HttpWebResponseUtility 的摘要说明
/// </summary>
/// <summary>  
/// 有关HTTP请求的辅助类  
/// </summary>  
public class HttpWebResponseUtility
{
    private static readonly string DefaultUserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)";
    /// <summary>  
    /// 创建GET方式的HTTP请求  
    /// </summary>  
    /// <param name="url">请求的URL</param>  
    /// <param name="timeout">请求的超时时间</param>  
    /// <param name="userAgent">请求的客户端浏览器信息，可以为空</param>  
    /// <param name="cookies">随同HTTP请求发送的Cookie信息，如果不需要身份验证可以为空</param>  
    /// <returns></returns>  
    public static HttpWebResponse CreateGetHttpResponse(string url, int? timeout, string userAgent, CookieCollection cookies)
    {
        if (string.IsNullOrEmpty(url))
        {
            throw new ArgumentNullException("url");
        }
        HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
        request.Method = "GET";
        request.UserAgent = DefaultUserAgent;
        if (!string.IsNullOrEmpty(userAgent))
        {
            request.UserAgent = userAgent;
        }
        if (timeout.HasValue)
        {
            request.Timeout = timeout.Value;
        }
        if (cookies != null)
        {
            request.CookieContainer = new CookieContainer();
            request.CookieContainer.Add(cookies);
        }
        return request.GetResponse() as HttpWebResponse;
    }
    /// <summary>  
    /// 创建POST方式的HTTP请求  
    /// </summary>  
    /// <param name="url">请求的URL</param>  
    /// <param name="parameters">随同请求POST的参数名称及参数值字典</param>  
    /// <param name="timeout">请求的超时时间</param>  
    /// <param name="userAgent">请求的客户端浏览器信息，可以为空</param>  
    /// <param name="requestEncoding">发送HTTP请求时所用的编码</param>  
    /// <param name="cookies">随同HTTP请求发送的Cookie信息，如果不需要身份验证可以为空</param>  
    /// <returns></returns>  
    public static HttpWebResponse CreatePostHttpResponse(string url, IDictionary<string, string> parameters, int? timeout, string userAgent, Encoding requestEncoding, CookieCollection cookies)
    {
        if (string.IsNullOrEmpty(url))
        {
            throw new ArgumentNullException("url");
        }
        if (requestEncoding == null)
        {
            throw new ArgumentNullException("requestEncoding");
        }
        HttpWebRequest request = null;
        //如果是发送HTTPS请求  
        if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
        {
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            request = WebRequest.Create(url) as HttpWebRequest;
            request.ProtocolVersion = HttpVersion.Version10;
        }
        else
        {
            request = WebRequest.Create(url) as HttpWebRequest;
        }
        request.Method = "POST";
        request.ContentType = "application/x-www-form-urlencoded";

        if (!string.IsNullOrEmpty(userAgent))
        {
            request.UserAgent = userAgent;
        }
        else
        {
            request.UserAgent = DefaultUserAgent;
        }

        if (timeout.HasValue)
        {
            request.Timeout = timeout.Value;
        }
        if (cookies != null)
        {
            request.CookieContainer = new CookieContainer();
            request.CookieContainer.Add(cookies);
        }
        //如果需要POST数据  
        if (!(parameters == null || parameters.Count == 0))
        {
            StringBuilder buffer = new StringBuilder();
            int i = 0;
            foreach (string key in parameters.Keys)
            {
                if (i > 0)
                {
                    buffer.AppendFormat("&{0}={1}", key, parameters[key]);
                }
                else
                {
                    buffer.AppendFormat("{0}={1}", key, parameters[key]);
                }
                i++;
            }
            byte[] data = requestEncoding.GetBytes(buffer.ToString());
            using (Stream stream = request.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }
        }
        return request.GetResponse() as HttpWebResponse;
    }

    private static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors)
    {
        return true; //总是接受  
    }

    #region 在C#用HttpWebRequest中发送GET/HTTP/HTTPS请求

    //（1）POST数据到HTTPS站点，用它来登录百度
    private void HttpWebRequest_POST1()
    {
        string loginUrl = "https://passport.baidu.com/?login";
        string userName = "userName";
        string password = "password";
        string tagUrl = "http://cang.baidu.com/" + userName + "/tags";
        Encoding encoding = Encoding.GetEncoding("gb2312");

        IDictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("tpl", "fa");
        parameters.Add("tpl_reg", "fa");
        parameters.Add("u", tagUrl);
        parameters.Add("psp_tt", "0");
        parameters.Add("username", userName);
        parameters.Add("password", password);
        parameters.Add("mem_pass", "1");
        HttpWebResponse response = HttpWebResponseUtility.CreatePostHttpResponse(loginUrl, parameters, null, null, encoding, null);
        string cookieString = response.Headers["Set-Cookie"];
    }

    //（2）发送GET请求到HTTP站点
    private void HttpWebRequest_GET()
    {
        string userName = "userName";
        string tagUrl = "http://cang.baidu.com/" + userName + "/tags";
        CookieCollection cookies = new CookieCollection();//如何从response.Headers["Set-Cookie"];中获取并设置CookieCollection的代码略  
        HttpWebResponse response = HttpWebResponseUtility.CreateGetHttpResponse(tagUrl, null, null, cookies);
    }

    //(3)发送POST请求到HTTP站点
    private void HttpWebRequest_POST2()
    {
        string loginUrl = "http://home.51cto.com/index.php?s=/Index/doLogin";
        string userName = "userName";
        string password = "password";

        IDictionary<string, string> parameters = new Dictionary<string, string>();
        parameters.Add("email", userName);
        parameters.Add("passwd", password);

        HttpWebResponse response = HttpWebResponseUtility.CreatePostHttpResponse(loginUrl, parameters, null, null, Encoding.UTF8, null);
    }
    //总结
    //在本文只是讲解了在C#中发送请求到HTTP和HTTPS的用法，分GET/POST两种方式，为减少一些繁琐和机械的编码，
    //周公将其封装为一个类，发送数据之后返回HttpWebResponse对象实例，
    //利用这个实例我们可以获取服务器端返回的Cookie以便用认证用户的身份继续发送请求，
    //或者读取服务器端响应的内容，不过在读取响应内容时要注意响应格式和编码，
    //本来在这个类中还有读取HTML和WML内容的方法（包括服务器使用压缩方式传输的数据），
    //但限于篇幅和其它方面的原因，此处省略掉了。如有机会，在以后的文章中会继续讲述这方面的内容。

    #endregion
}