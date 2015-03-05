using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class UserCenter_IdentifyHead_IDCard : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null == Session["IdenHeadPass"])
            {
                Response.Redirect("~/UserCenter/Default.aspx", true);
            }
        }
    }
    //验证上传文件的格式
    public bool IsAllowedExtension(FileUpload hifile)
    {
        int fileLen = hifile.PostedFile.ContentLength;
        byte[] imgArray = new byte[fileLen];
        hifile.PostedFile.InputStream.Read(imgArray, 0, fileLen);
        MemoryStream ms = new MemoryStream(imgArray);
        System.IO.BinaryReader r = new System.IO.BinaryReader(ms);

        string fileclass = "";
        byte buffer;
        try
        {
            buffer = r.ReadByte();
            fileclass = buffer.ToString();
            buffer = r.ReadByte();
            fileclass += buffer.ToString();

        }
        catch
        {

        }
        r.Close();
        ms.Close();
        if (fileclass == "255216" || fileclass == "7173")//说明255216是jpg;7173是gif;6677是BMP,13780是PNG;7790是exe,8297是rar
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    protected void btnUpload_Click(object sender, ImageClickEventArgs e)
    {
        #region 上传验证
        if (!fileUpload.HasFile)
        {
            lblMsg.Text = "请选择上传图片!";
            return;
        }
        if (fileUpload.PostedFile.ContentLength > 200000)
        {
            lblMsg.Text = "上传图片过大！";
            return;
        }
        if (IsAllowedExtension(fileUpload) == false)
        {
            lblMsg.Text = "请上传jpg或gif格式图片！";
            return;
        }
        bool result = WSClient.CMOPWebWS().CheckCardIDUpLoadCount(CommonOperation.GetIP4Address(), DateTime.Now);
        if (result == false)
        {
            lblMsg.Text = "您今天上传次数已超过5次！";
            return;
        }
        #endregion

        string imgSaveFilePath = string.Empty;
        string errMsg = string.Empty;
        bool isAddSucc = false;
        //
        if (this.fileUpload.HasFile)
        {
            byte[] imageFileBytes = this.fileUpload.FileBytes;
            //

            string imgPath = "images/w/";
            isAddSucc = WSClient.ImageService().AddImage(imgPath, System.IO.Path.GetExtension(fileUpload.PostedFile.FileName), imageFileBytes, ref imgSaveFilePath, ref errMsg);
            if (isAddSucc == false)
            {
                lblMsg.Text = errMsg;
            }
            else
            {
                ViewState["imgUrl"] = imgSaveFilePath;
                imgPreview.ImageUrl = imgSaveFilePath;

                lblMsg.Text = "上传成功!";
            }
        }
    }
    /// <summary>
    /// 插入头像验证信息
    /// </summary>
    /// <param name="identifyType"></param>
    /// <param name="identifyInfo"></param>
    /// <returns></returns>
    private bool InsertIdentifyInfo(int identifyType, string identifyInfo)
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);

        int age = DateTime.Now.Year - Convert.ToDateTime(userAmply.B).Year;
        return WSClient.SocialCenterWS().AddHeadImgIdentify(userInfo.UserID, DateTime.Now, identifyType, 0, identifyInfo, "", userInfo.NickName, age, userAmply.G, userInfo.HeadID);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (null == ViewState["imgUrl"])
            {
                lblMsg.Text = "请选择上传图片!";
                return;
            }
            string identifyInfo = Convert.ToString(ViewState["imgUrl"]);
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            int deductionsAmount = Convert.ToInt32(WebCommon.GetFFJJGWebXML("ffjjgweb/HeadImgIdentify/", "IDCard"));
            foreach (var item in userInfo.Lua)
            {
                if (item.Ti == 4)
                {
                    if (item.Ac < deductionsAmount)
                    {
                        lblMsg.Text = "您的账户余额不足~";
                        return;
                    }
                }
            }
            if (Deductions(deductionsAmount, userInfo))
            {
                bool result = InsertIdentifyInfo(1, identifyInfo);
                if (result == true)
                {
                    lblMsg.Text = "提交成功，请耐心等待审查通过！";
                }
                else
                {
                    lblMsg.Text = "提交失败！";
                }
            }
        }
        catch (Exception ex)
        {
            PublicClass.WriteErrLog(ex.Message);
        }


    }
    /// <summary>
    /// 扣费
    /// </summary>
    /// <param name="amount"></param>
    private bool Deductions(int amount, WebUserInfo userInfo)
    {
        List<AcountInfo> lai = new List<AcountInfo>();
        AcountInfo ai = new AcountInfo();
        ai.A = amount;
        ai.T = 4;
        ai.N = "金币";
        lai.Add(ai);

        int gameID = 0; int items = 1; SubItem subitm = SubItem.siDeduct;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "进行头像认证，系统扣除" + ai.N + ai.A;

        RichDirection direction = RichDirection.drOut;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;
        //
        int result = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai.ToArray(), costRelationType, key, matchID, matchNum);
        if (result < 0)
        {
            if (result == -408)
            {
                this.lblMsg.Text = "您的账户余额不足";
            }
            else
            {
                this.lblMsg.Text = "扣除金币错误，请联系管理员";
            }
            return false;
        }
        return true;
    }
}