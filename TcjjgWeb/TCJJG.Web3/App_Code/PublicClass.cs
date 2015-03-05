using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Collections.Specialized;
using System.Text;
using System.IO;
using System.Configuration;

/// <summary>
///与本web应用有关的操作
/// </summary>
public static class PublicClass
{
    /// <summary>
    /// 记录错误异常
    /// </summary>
    /// <param name="ex"></param>
    public static void WriteErrLog(string ex)
    {
        StreamWriter sw = null;
        try
        {
            sw = File.CreateText(System.Web.HttpContext.Current.Server.MapPath("~/ExceptionLog/") + "ex_" + System.DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + new Random().Next(1000) + ".log");
            sw.WriteLine(ex);
        }
        catch (Exception)
        {
            return;
        }
        finally
        {
            if (sw != null)
            {
                sw.Close();
                sw.Dispose();
            }
        }
    }
}
