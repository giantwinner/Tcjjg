using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class CustomerService_Appeal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
            lblUploadMessage.Text = "请选择上传图片!";
            return;
        }
        if (fileUpload.PostedFile.ContentLength > 51200)
        {
            lblUploadMessage.Text = "上传图片过大！";
            return;
        }
        if (IsAllowedExtension(fileUpload) == false)
        {
            lblUploadMessage.Text = "请上传jpg或gif格式图片！";
            return;
        }
        //int UpLoadCount = CmopWeb.CheckCardIDUpLoadCount(CommonOperation.GetIP4Address(), DateTime.Now);
        //if (UpLoadCount == -1)
        //{
        //    lblUploadMessage.Text = "您今天上传次数已超过5次！";
        //    return;
        //}
        bool result = WSClient.CMOPWebWS().CheckCardIDUpLoadCount(CommonOperation.GetIP4Address(), DateTime.Now);
        if (result == false)
        {
            lblUploadMessage.Text = "您今天上传次数已超过5次！";
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
                lblUploadMessage.Text = errMsg;
            }
            else
            {
                imgPreview.ImageUrl = imgSaveFilePath;
                lblUploadMessage.Text = "上传成功!";
            }
        }

    }
    protected void ImgBtnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        string userName = txtUserName.Text;
        string realName = txtRealName.Text;
        string idCardNum = txtIdCardNum.Text;
        string idCardPicture = imgPreview.ImageUrl;
        if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(realName) || string.IsNullOrEmpty(idCardNum) || string.IsNullOrEmpty(idCardPicture))
        {
            lblUploadMessage.Text = "请输入后再提交!";
            return;
        }
        if (imgPreview.ImageUrl == "~/Images/CustomerService/tcjjg_2012__apperlimg.jpg")
        {
            lblUploadMessage.Text = "请选择上传图片！";
            return;
        }
        //string result = CmopWeb.AddAppealAccountInfo(userName, realName, idCardNum, idCardPicture, DateTime.Now);
        bool result = WSClient.CMOPWebWS().AddAppealAccountInfo(userName, realName, idCardNum, idCardPicture, DateTime.Now);
        if (result == true)
        {
            lblUploadMessage.Text = "提交成功！";
            ImgBtnSubmit.Enabled = false;
        }
        else
        {
            lblUploadMessage.Text = "提交失败！";
        }
    }
}