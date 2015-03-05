<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_AwardCenter_Nav.ascx.cs"
    Inherits="UserControl_UC_AwardCenter_Nav" %>
<div class="subPage_Left_Nav">
    <a href="../AwardCenter/GoodsList.aspx"><span class="subPage_Left_Nav_Item">道具兑换区</span></a>
    <a href="../AwardCenter/AwardList.aspx"><span class="subPage_Left_Nav_Item">奖品兑换区</span></a>
    <a href="../Sales/SalesInfo.aspx"><span class="subPage_Left_Nav_Item">玩家拍卖区</span></a>
    <a href="../AwardCenter/Stadiums.aspx"><span class="subPage_Left_Nav_Item">同城竞技馆</span></a>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        //左侧导航
        //        $(".subPage_Left_Nav_Item").eq(0).addClass("subPage_Left_Nav_Item_Selected");
        //        $(".subPage_Left_Nav_Item").click(function () {
        //            $(".subPage_Left_Nav_Item").removeClass("subPage_Left_Nav_Item_Selected");
        //            $(this).addClass("subPage_Left_Nav_Item_Selected");
        //        })
    })
</script>
