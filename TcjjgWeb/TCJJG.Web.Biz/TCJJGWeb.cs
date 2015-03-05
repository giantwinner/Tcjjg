using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TCJJG.Web.DB;

namespace TCJJG.Web.Biz
{
    public class TCJJGWeb
    {
        #region

        /// <summary>
        /// 查询公告
        /// </summary>
        /// <param name="typeBase"></param>
        /// <param name="newsTypeID"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageCount"></param>
        /// <param name="pageTotal"></param>
        /// <param name="newsTypeID1"></param>
        /// <param name="newsTypeName"></param>
        /// <returns></returns>
        public static List<FWP_News_ByTypeResult> FWP_News_ByType(int typeBase, int newsTypeID, int pageIndex, int pageCount, ref int? pageTotal, ref int? newsTypeID1, ref string newsTypeName)
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.FWP_News_ByType(typeBase, newsTypeID, pageIndex, pageCount, ref pageTotal, ref newsTypeID1, ref newsTypeName).ToList();

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return null;
            }
        }

        /// <summary>
        /// 查询公告详细内容
        /// </summary>
        /// <param name="newsID"></param>
        /// <param name="last"></param>
        /// <param name="next"></param>
        /// <returns></returns>
        public static List<FWP_News_SelectContentResult> FWP_News_SelectContent(int newsID, ref int? last, ref int? next)
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.FWP_News_SelectContent(newsID, ref last, ref next).ToList();

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return null;
            }
        }

        /// <summary>
        /// 新闻评论（赞、踩）
        /// </summary>
        /// <param name="newsID"></param>
        /// <param name="iP"></param>
        /// <param name="commentType"></param>
        /// <returns></returns>
        public static int FWT_News_Comment(int newsID,string  iP,int commentType,ref int? newCount)
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.proc_FWT_News_Comment(newsID, iP, commentType,ref newCount);

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return -1;
            }
        }

        #endregion

        #region 查询帮助信息

        /// <summary>
        /// 获取帮助名称和内容
        /// </summary>
        /// <param name="helpType">帮助类别</param>
        /// <returns></returns>
        public static List<proc_HelpCenter_GetHelpInfoByHelpTypeResult> SelectByType(int? helpType, ref int? temp)
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.proc_HelpCenter_GetHelpInfoByHelpType(helpType, 1, 200, ref temp).ToList();

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="helpID"></param>
        /// <returns></returns>
        public static List<proc_HelpCenter_GetDetail_HelpInfoResult> SelectContent(int? helpID)
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.proc_HelpCenter_GetDetail_HelpInfo(helpID).ToList();

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                throw;
            }
        }

        /// <summary>
        /// 查询常见问题标题
        /// </summary>
        /// <returns></returns>
        public static List<proc_FAQ_SelectInfoListResult> SelectFAQInfoList()
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.proc_FAQ_SelectInfoList().ToList();

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return null;
            }
        }

        #endregion

        #region 获得维护页面内容
        public static proc_MaintenancePage_SelectPageInfoResult GetMaintenancePage()
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            return da.proc_MaintenancePage_SelectPageInfo().FirstOrDefault();
        }
        #endregion

        #region 首页切换图片

        /// <summary>
        /// 首页切换图片
        /// </summary>
        /// <returns></returns>
        public static List<Yu_IndexAD_Sel_ImgResult> GetIndexADImg()
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            try
            {
                return da.Yu_IndexAD_Sel_Img().ToList();

            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return null;
            }
        }

        #endregion

        #region 首页文字内容

        public static List<proc_IndexPage_GetPageAllContentResult> GetPageAllContent()
        {
            TCJJGWebDataContext da = new TCJJGWebDataContext();
            return da.proc_IndexPage_GetPageAllContent().ToList();
        }
        #endregion
    }
}
