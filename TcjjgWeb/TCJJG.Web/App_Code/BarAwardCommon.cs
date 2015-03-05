using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
///BarAwardCommon 的摘要说明
/// </summary>
public class BarAwardCommon : System.Web.UI.Page
{
    public BarAwardCommon()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }
    private static Dictionary<Guid, bool> barDictionary = new Dictionary<Guid, bool>();
    /// <summary>
    /// 更新网吧当前奖品兑换请求状态
    /// </summary>
    /// <param name="pro1"></param>
    /// <param name="flag">当有玩家兑奖时 更新为true,当处理完毕后 更新为false</param>
    public static void UpdateBarAward(Guid pro1, bool flag)
    {
        if (barDictionary.ContainsKey(pro1))
        {
            barDictionary[pro1] = flag;
        }
        else
        {
            barDictionary.Add(pro1, flag);
        }
    }
    /// <summary>
    /// 检查当前网吧是否有奖品兑换请求
    /// </summary>
    /// <param name="pro1"></param>
    /// <returns></returns>
    public static bool GetBarAwardFlag(Guid pro1)
    {
        if (barDictionary.ContainsKey(pro1))
        {
            return barDictionary[pro1];
        }
        else
        {
            return false;
        }
    }
}