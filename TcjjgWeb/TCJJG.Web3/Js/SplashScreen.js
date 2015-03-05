function onSourceDownloadProgressChanged(sender, eventArgs) {
    try {
        sender.findName("uxStatus").Text = "总进度: " + Math.round((eventArgs.progress * 1000)) / 10 + "%";
        sender.findName("uxProgress").Width = eventArgs.progress * 240;
        if (eventArgs.progress < 0.4) {
            sender.findName("uxStatusText").Text = "正在加载大厅资源..";
        } else if (eventArgs.progress < 0.6) {
            sender.findName("uxStatusText").Text = "正在加载斗地主资源..";
        } else if (eventArgs.progress < 0.7) {
            sender.findName("uxStatusText").Text = "正在分析斗地主资源..";
        } else if (eventArgs.progress < 0.9) {
            sender.findName("uxStatusText").Text = "正在获取配置信息,请稍候..";
        } else if (eventArgs.progress > 0.99) {
            sender.findName("uxStatusText").Text = "正在初始化游戏,请稍候..";
            sender.findName("uxStatusText").SetValue("Visibility", "Collapsed");
            sender.findName("uxStatus").SetValue("Visibility", "Collapsed");
        } else {
            sender.findName("uxStatusText").Text = "正在初始化游戏,请稍候..";
                }
       
    } catch (e) {
        sender.findName("uxStatusText").Text = "正在初始化游戏,请稍候..";
    }
}
