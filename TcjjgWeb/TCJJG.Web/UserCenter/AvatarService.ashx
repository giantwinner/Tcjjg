<%@ WebHandler Language="C#" Class="AvatarService" %>

using System;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web.SessionState;


public class AvatarService : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        TCJJG.Web.Model.WebUserInfo ui = context.Session["UserInfo"] as TCJJG.Web.Model.WebUserInfo;

        context.Response.ContentType = "text/plain";
        string action = context.Request["myaction"];
        if (action == "upload")
        {
            string msg = "";
            string result = "0";
            string ww = "0";
            string hh = "0";
            string size = "1";//缩放

            string strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";


            HttpPostedFile file = context.Request.Files[0];
            string ext = Path.GetExtension(file.FileName).ToLower();
            if (ext != ".jpg" && ext != ".gif" && ext != ".png" && ext != ".jpeg")
            {
                msg = "请您上传jpg、gif、png图片";
                strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";
                context.Response.Write(strWrite);
                return;
            }
            if (file.ContentLength > 5 * 1024 * 1024)
            {
                msg = "请您上传512字节内的图片";
                strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";
                context.Response.Write(strWrite);
                return;
            }

            try
            {
                #region  头像的上传次数 < 5

                bool ope = TCJJG.Web.Biz.WSClient.CMOPWebWS().UploadUserHeadCheck(ui.UserID);
                if (ope == false)
                {
                    msg = "今天上传已经超过5次";
                    strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";
                    context.Response.Write(strWrite);
                    return;
                }

                #endregion

                #region 等级验证

                var rankInfo = TCJJG.Web.UserCenter.UserCenter.UserInfo().GetRankByExperience(ui.UserID);
                int currRank = 1;
                if (null != rankInfo)
                {
                    currRank = Convert.ToInt32(rankInfo.Rank);
                }

                int needRank = Convert.ToInt32(TCJJG.Web.Biz.WebCommon.GetFFJJGWebXML("ffjjgweb/UpLoadHeadImgRank/", "Rank"));
                if (currRank < needRank)
                {
                    msg = "等级不足" + needRank + "级";
                    strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";
                    context.Response.Write(strWrite);
                    return;
                }

                #endregion
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write("上传头像-资格验证", ex.Message, true);
            }


            string newName = Guid.NewGuid().ToString();
            string tempPath = "upload/";

            string img = tempPath + newName + ext;
            string filePath = context.Server.MapPath(img);
            tempPath = context.Server.MapPath(tempPath);
            if (!Directory.Exists(tempPath))
            {
                Directory.CreateDirectory(tempPath);
            }
            try
            {
                using (System.Drawing.Image originalImage = System.Drawing.Image.FromStream(file.InputStream))
                {
                    int w = originalImage.Width;
                    int h = originalImage.Height;
                    if (w > 1400 || h > 1400)
                    {
                        msg = "请您上传大小在1400*1400以内的图片";
                        strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";

                        context.Response.Write(strWrite);
                        return;
                    }
                    else if (w < 50 || h < 50)
                    {
                        msg = "请您上传大于50*50的图片";
                        strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";

                        context.Response.Write(strWrite);
                        return;
                    }
                    else
                    {
                        if (w > 300 || h > 300)
                        {
                            float sizeM;
                            using (System.Drawing.Image thumb = GetThumbImage(originalImage, 300, 300, true, out sizeM))
                            {
                                thumb.Save(filePath + ".view.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
                                ww = thumb.Width.ToString();
                                hh = thumb.Height.ToString();
                                size = sizeM.ToString();
                            }
                        }
                        else
                        {
                            size = "1";
                            ww = w.ToString();
                            hh = h.ToString();
                        }
                        file.SaveAs(filePath);//保存原图
                        result = "1";
                        msg = img;
                    }
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write("上传头像", ex.Message, true);
            }

            strWrite = "{ \"result\":" + result + ",\"size\":" + size + ",\"msg\":\"" + msg + "\",\"w\":" + ww + ",\"h\":" + hh + "}";
            context.Response.Write(strWrite);
        }
        else if (action == "view")
        {
            context.Response.ContentType = "image/JPEG";
            //清除该页输出缓存，设置该页无缓存 
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = System.DateTime.Now.AddMilliseconds(0);
            context.Response.Expires = 0;
            context.Response.CacheControl = "no-cache";
            context.Response.AppendHeader("Pragma", "No-Cache");

            using (Image viewimg = GetViewImage("view"))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    viewimg.Save(ms, ImageFormat.Jpeg);
                    context.Response.ClearContent();
                    context.Response.BinaryWrite(ms.ToArray());
                }
            }
        }
        else if (action == "save")
        {
            context.Response.ContentType = "text/plain";
            using (Image viewimg = GetViewImage("save"))
            {
                try
                {
                    //这里没有生成缩略图，如果需要，可以在这里加
                    string file = HttpContext.Current.Server.MapPath(context.Request["file"]);
                    DeleteImage();

                    string imgPath = "images/hs/";
                    string imgSaveFilePath = string.Empty;
                    string errMsg = string.Empty;
                    string ext = Path.GetExtension(file).ToLower();
                    bool isAddSucc = TCJJG.Web.Biz.WSClient.ImageService().AddImage(imgPath, ext, ImageToBytes(viewimg, ImageFormat.Jpeg), ref imgSaveFilePath, ref errMsg);

                    if (isAddSucc)
                    {
                        ui.HeadID = TCJJG.Web.UserCenter.UserCenter.UserInfo().F_UserUpdateHead(ui.UserID, imgSaveFilePath, ui.Sex);
                        if (ui.HeadID == imgSaveFilePath)
                        {
                            try
                            {
                                //检查用户是否已经更换认证头像，如果更换则删除认证标志
                                bool isdelHeadVIP = TCJJG.Web.Biz.WSClient.SocialCenterWS().HeadIdentifyIsChange(ui.UserID);
                                if (isdelHeadVIP)
                                {
                                    UserInfoSvcClient uin = new UserInfoSvcClient();
                                    uin.RemoveRole(ui.UserID, 10003);
                                    System.Collections.ArrayList ar = new System.Collections.ArrayList(ui.Roles);
                                    ar.Remove("10003");
                                    ui.Roles = (string[])ar.ToArray(typeof(string));
                                    context.Session["UserInfo"] = ui;
                                }
                            }
                            catch (Exception ex)
                            {
                                FFJJG.Server.Utils.Logging.write(ex);
                            }

                        }
                        context.Response.Write(ui.HeadID);
                    }


                }
                catch (Exception ex)
                {
                    context.Response.Write("0");
                    FFJJG.Server.Utils.Logging.write("上传头像-保存", ex.Message, true);
                }
            }
        }
        else if (action == "delete")
        {
            DeleteImage();
        }
    }

    /// <summary>
    /// 将图片Image转换成Byte[]
    /// </summary>
    /// <param name="Image">image对象</param>
    /// <param name="imageFormat">后缀名</param>
    /// <returns></returns>
    public byte[] ImageToBytes(Image Image, System.Drawing.Imaging.ImageFormat imageFormat)
    {
        if (Image == null) { return null; }

        byte[] data = null;

        using (MemoryStream ms = new MemoryStream())
        {

            using (Bitmap Bitmap = new Bitmap(Image))
            {

                Bitmap.Save(ms, imageFormat);

                ms.Position = 0;

                data = new byte[ms.Length];

                ms.Read(data, 0, Convert.ToInt32(ms.Length));

                ms.Flush();

            }

        }

        return data;

    }


    public static void DeleteImage()
    {
        string file = HttpContext.Current.Server.MapPath(HttpContext.Current.Request["file"]);
        try
        {
            if (File.Exists(file))
            {
                File.Delete(file);
            }
            if (HttpContext.Current.Request["size"] != "1")
            {
                File.Delete(file + ".view.jpg");
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("上传头像-删除图片", ex.Message, true);
        }
    }

    private static Image GetViewImage(string type)
    {
        float x = float.Parse(HttpContext.Current.Request["x"]);
        float y = float.Parse(HttpContext.Current.Request["y"]);
        float w = float.Parse(HttpContext.Current.Request["w"]);
        float h = float.Parse(HttpContext.Current.Request["h"]) + 1;
        float size = float.Parse(HttpContext.Current.Request["size"]);
        if (size != 1.0f)
        {
            x = x / size;
            y = y / size;
            w = w / size;
            h = h / size;
        }
        using (Image img = CuteImage(HttpContext.Current.Request["file"], x, y, w, h))
        {
            float temp;
            Image viewimg = null;
            if (type == "view")
            {
                viewimg = GetThumbImage(img, 175, 175, false, out temp);
            }
            else if (type == "save")
            {
                viewimg = GetThumbImage(img, 72, 72, false, out temp);
            }

            return viewimg;
        }
    }


    private static Image CuteImage(string file, float x, float y, float width, float height)
    {
        string oldFile = HttpContext.Current.Server.MapPath(file);
        using (System.Drawing.Image oldImg = System.Drawing.Image.FromFile(oldFile))
        {
            System.Drawing.Image cuteImg = CuteImage(oldImg, x, y, width, height);
            return cuteImg;
        }
    }

    private static System.Drawing.Image CuteImage(System.Drawing.Image oldImage, float x, float y, float width, float height)//切图
    {
        width = Math.Min(oldImage.Width - x, width);
        height = Math.Min(oldImage.Height - y, height);
        System.Drawing.Image newBitmap = new Bitmap((int)width, (int)height);
        using (System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(newBitmap))
        {
            g.InterpolationMode = InterpolationMode.High;
            g.SmoothingMode = SmoothingMode.AntiAlias;
            g.CompositingQuality = CompositingQuality.HighQuality;
            g.DrawImage(oldImage, new RectangleF(0, 0, width, height), new RectangleF(x, y, width, height), GraphicsUnit.Pixel);
            g.Save();
        }
        return newBitmap;
    }

    /// <summary>
    /// 得到图片缩略图
    /// </summary>
    /// <param name="img">图片对象</param>
    /// <param name="maxWidth">最大宽度</param>
    /// <param name="maxHeight">最大高度</param>
    /// <returns></returns>
    public static System.Drawing.Image GetThumbImage(System.Drawing.Image img, int maxWidth, int maxHeight, bool isBlock, out float size)
    {
        int tWidth;
        int tHeight;
        size = 1;

        if (!isBlock)
        {
            tWidth = maxWidth;
            tHeight = maxHeight;
        }
        else
        {
            if (!(maxHeight > img.Height && maxWidth > img.Width))
            {
                float HeightMultipier = (float)maxHeight / (float)img.Height;
                float WidthMultipier = (float)maxWidth / (float)img.Width;
                if (HeightMultipier > 1) HeightMultipier = 1;
                if (WidthMultipier > 1) WidthMultipier = 1;
                float SizeMultiplier = WidthMultipier < HeightMultipier ? WidthMultipier : HeightMultipier;
                size = SizeMultiplier;
                tWidth = (int)(img.Width * SizeMultiplier);
                tHeight = (int)(img.Height * SizeMultiplier);
            }
            else
            {
                tWidth = img.Width;
                tHeight = img.Height;
            }
        }
        System.Drawing.Image bitmap = new System.Drawing.Bitmap(tWidth, tHeight);

        //新建一个画板
        Graphics g = System.Drawing.Graphics.FromImage(bitmap);

        //设置高质量插值法
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;

        //设置高质量,低速度呈现平滑程度
        g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;

        //清空画布并以透明背景色填充
        g.Clear(Color.Transparent);

        //在指定位置并且按指定大小绘制原图片的指定部分
        g.DrawImage(img, new Rectangle(0, 0, tWidth, tHeight),
            new Rectangle(0, 0, img.Width, img.Height),
            GraphicsUnit.Pixel);
        return bitmap;
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}