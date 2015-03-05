<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userLogout.aspx.cs" Inherits="UserCenter_userLogout" %>
<%

    Session.Abandon();
    if (null == Request.Params["bbsToUrl"])
    {
        Response.Redirect("tcjjgbbs.aspx?BBSUserLogout=BBSUserLogout", true);
    }
    Response.Redirect("~/", true);
%>