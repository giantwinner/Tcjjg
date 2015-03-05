<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userLogout.aspx.cs" Inherits="UserCenter_userLogout" %>

<%
    Session.Abandon();
    if (null != Request.QueryString["cc"])
    {
        if (null != Request.Cookies["tcjjgVisitor"])
        {
            HttpCookie currCookie = Request.Cookies["tcjjgVisitor"];
            currCookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(currCookie);
        }
    }
    if (null == Request.Params["bbsToUrl"])
    {
        Response.Redirect("tcjjgbbs.aspx?BBSUserLogout=BBSUserLogout", true);
    }
    Response.Redirect("~/", true);
%>