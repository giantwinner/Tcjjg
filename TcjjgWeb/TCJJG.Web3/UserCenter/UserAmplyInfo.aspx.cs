using System;
using System.Web.UI;
using TCJJG.Web.Model;
using System.IO;
using TCJJG.Web.Biz;
using TCJJG.Web.DB;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;
using System.Web.UI.HtmlControls;

public partial class UserCenter_UserAmplyInfo : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ui = Session["UserInfo"] as WebUserInfo;
        if (!IsPostBack)
        {
            FFJJG.Common.UserCenter.UserAmplyInfo uai = UserCenter.UserInfo().F_SelectUserInfoAmply(ui.UserID);
            img_CurrentHeadImage.ImageUrl = ui.HeadID + "?temp=" + DateTime.Now.Millisecond.ToString();
            if (string.IsNullOrEmpty(Convert.ToString(ui.Sex)))
            {
                DivSex.InnerText = "1";
            }
            else
            {
                DivSex.InnerText = Convert.ToString(ui.Sex);
            }

        }
        //
        if (base.IsPartnerManager() || base.IsCityManager())
        {
            this.Panel1.Visible = false;
            this.Button1.Enabled = false;
            this.btn_Image.Enabled = false;
        }
    }

    /// <summary>
    /// 前台界面调用，获得图片服务器地址
    /// </summary>
    /// <returns></returns>
    public string GetImgServerURL()
    {
        string ImgServerURL = WebCommon.GetFFJJGWebXML("ffjjgweb/", "ImgServerURL");
        return ImgServerURL;
    }

    private WebUserInfo ui = null;

    /// <summary>
    /// 上传事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        img_CurrentHeadImage.ImageUrl = ui.HeadID + "?temp=" + DateTime.Now.Millisecond.ToString();
        if (!this.checkUpLoad()) return;
        this.upLoadHead();
    }

    /// <summary>
    /// 检测是否有上传资格
    /// </summary>
    /// <returns></returns>
    private bool checkUpLoad()
    {
        #region 0 NULL 1 头像的大小 2 头像的后缀名 .gif .jpeg .jpg

        //0
        if (!fileImg.HasFile)
        {
            this.upLoadSetCss(2);
            return false;
        }
        //1
        int ContentLength = this.fileImg.PostedFile.ContentLength;
        if (ContentLength > 300000)
        {
            this.upLoadSetCss(2);
            return false;
        }
        //2
        string FileExtension = System.IO.Path.GetExtension(this.fileImg.PostedFile.FileName);
        if (FileExtension != ".gif" && FileExtension != ".jpeg" && FileExtension != ".jpg")
        {
            this.upLoadSetCss(2);
            return false;
        }

        #endregion

        #region 4 头像的上传次数 < 5

        //4
        bool ope = WSClient.CMOPWebWS().UploadUserHeadCheck(ui.UserID);
        if (ope == false)
        {
            this.upLoadSetCss(6);
            return false;
        }

        #endregion

        return true;
    }

    /// <summary>
    /// 上传头像详细
    /// </summary>
    private void upLoadHead()
    {
        try
        {
            #region 获取头像名

            string headID = CommonOperation.GetFileName(ui.HeadID);
            if (headID.Length < 20)//原来是系统默认头像
            {
                string n1 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(ui.UserID.ToString(), "MD5").ToLower();
                string n2 = CommonOperation.CreateCustomString();
                headID = n1 + n2;
            }

            #endregion

            #region 记录头像名

            UpLoadHead up = new UpLoadHead();
            up.BigHead = "Images/hb/" + headID;
            up.SmallHead = "Images/hs/" + headID;
            up.HeadID = headID;
            Session.Remove("UpLoadHead");
            Session["UpLoadHead"] = up;

            #endregion

            #region 删除原有大头像

            if (!WSClient.ImageService().DeleteHeadImage(up.BigHead))
            {
                PublicClass.WriteErrLog(" 删除原有大头像失败！");
            }

            #endregion

            #region 保存新的大头像

            string savePath = string.Empty;
            if (!WSClient.ImageService().AddHeadBigImage(up.BigHead, fileImg.FileBytes, ref savePath, ref height, ref width))
            {
                PublicClass.WriteErrLog(" 保存新的大头像失败！");
            }
            #endregion

            #region 前台视图展现
            this.img.Src = this.drop_img.Src = savePath + "?temp=" + DateTime.Now.Millisecond.ToString();
            ViewState["BigImage"] = savePath;
            ViewState["Height"] = height;
            ViewState["Width"] = width;

            #endregion

            #region 通知界面

            this.upLoadSetCss(1);

            #endregion
        }
        catch (Exception e1)
        {
            PublicClass.WriteErrLog("#1.userName:" + ui.UserName + ". ex:" + e1.Message);
            this.upLoadSetCss(3);
        }
    }

    /// <summary>
    /// 回发通知界面
    /// </summary>
    /// <param name="ty"></param>
    private void upLoadSetCss(int ty)
    {
        ScriptManager.RegisterStartupScript(this.Page, GetType(), "uploadsetcss", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >uploadsetcss('" + ty + "');</script>", false);
    }

    public int width;
    public int height;

    /// <summary>
    /// 剪切头像事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_Image_Click(object sender, EventArgs e)
    {
        try
        {
            #region 获取头像文件名

            if (Session["UpLoadHead"] == null || string.IsNullOrEmpty(this.img.Src) || string.IsNullOrEmpty(this.drop_img.Src))
            {
                img_CurrentHeadImage.ImageUrl = ui.HeadID;
                this.upLoadSetCss(2);
                return;
            }
            UpLoadHead up = Session["UpLoadHead"] as UpLoadHead;

            #endregion

            #region 删除原有小图像

            WSClient.ImageService().DeleteHeadImage(up.SmallHead);

            #endregion

            #region 获得剪切头像参数

            int imageWidth = Int32.Parse(txt_width.Text.Replace("px", ""));//图片实际宽度
            int imageHeight = Int32.Parse(txt_height.Text.Replace("px", ""));//图片实际高度
            int cutTop = Int32.Parse(txt_top.Text);//距离顶部
            int cutLeft = Int32.Parse(txt_left.Text);//距离左边
            int dropWidth = Int32.Parse(txt_DropWidth.Text);//截取框的宽
            int dropHeight = Int32.Parse(txt_DropHeight.Text);//截取框的高

            #endregion

            #region 剪切大头像为小头像并保存

            string serviceUrl = string.Empty;
            WSClient.ImageService().CutHeadBigImage(up.BigHead, up.SmallHead, 0, 0, dropWidth, dropHeight, cutLeft, cutTop, imageWidth, imageHeight, ref serviceUrl);
            img_CurrentHeadImage.ImageUrl = Path.Combine(serviceUrl, up.SmallHead) + "?temp=" + DateTime.Now.Millisecond.ToString();
            this.img.Src = this.drop_img.Src = Convert.ToString(ViewState["BigImage"]) + "?temp=" + DateTime.Now.Millisecond.ToString();
            height = Convert.ToInt32(ViewState["Height"]);
            width = Convert.ToInt32(ViewState["Width"]);

            #endregion

            #region 更新头像到数据库

            UpdateHead(Path.Combine(serviceUrl, up.SmallHead));

            #endregion

            #region 界面回发

            this.upLoadSetCss(7);

            #endregion
        }
        catch (Exception e1)
        {
            PublicClass.WriteErrLog("#2.userName:" + ui.UserName + ". ex:" + e1.Message);
            this.upLoadSetCss(4);
        }
    }

    /// <summary>
    /// 修改头像更新数据库
    /// </summary>
    /// <param name="headID"></param>
    private void UpdateHead(string headID)
    {
        ui.HeadID = UserCenter.UserInfo().F_UserUpdateHead(ui.UserID, headID, ui.Sex);
    }
}