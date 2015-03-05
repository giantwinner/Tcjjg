using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;
using System.IO;

public partial class UserCenter_IdentifyHead_IDCard : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null == Session["IdenHeadPass"])
            {
                Response.Redirect("~/UserCenter/UpdateHeadPortrait.aspx", true);
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
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }
        r.Close();
        ms.Close();
        if (fileclass == "255216")//说明255216是jpg;7173是gif;6677是BMP,13780是PNG;7790是exe,8297是rar
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
            lblMsg.Text = "请上传jpg图片！";
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

        if (this.fileUpload.HasFile)
        {
            byte[] imageFileBytes = this.fileUpload.FileBytes;

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
        if (null == ViewState["imgUrl"])
        {
            lblMsg.Text = "请选择上传图片!";
            return;
        }
        string identifyInfo = Convert.ToString(ViewState["imgUrl"]);

        bool result = InsertIdentifyInfo(1, identifyInfo);
        if (result == true)
        {
            lblMsg.Text = "提交成功，请耐心等待审查！";
            btnSubmit.Enabled = false;
        }
        else
        {
            lblMsg.Text = "提交失败！";
        }
    }
}