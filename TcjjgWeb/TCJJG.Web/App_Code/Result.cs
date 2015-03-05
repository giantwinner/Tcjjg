using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Result 的摘要说明
/// </summary>
public class Result
{
    private string _status;

    public string Status
    {
        get { return _status; }
        set { _status = value; }
    }
    private string _userID;

    public string UserID
    {
        get { return _userID; }
        set { _userID = value; }
    }
    private string _userName;

    public string UserName
    {
        get { return _userName; }
        set { _userName = value; }
    }
    private string _userServer;

    public string UserServer
    {
        get { return _userServer; }
        set { _userServer = value; }
    }
    private string _serverName;

    public string ServerName
    {
        get { return _serverName; }
        set { _serverName = value; }
    }
    private string _userRole;

    public string UserRole
    {
        get { return _userRole; }
        set { _userRole = value; }
    }
    private string _userLevel;

    public string UserLevel
    {
        get { return _userLevel; }
        set { _userLevel = value; }
    }
    private string _chongZhi;

    public string ChongZhi
    {
        get { return _chongZhi; }
        set { _chongZhi = value; }
    }

    public Result()
    {
    }
}