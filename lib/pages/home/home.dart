  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:saber/components/home/banner_ad_widget.dart';//下面的廣告
  import 'package:saber/components/navbar/responsive_navbar.dart';//響應式導航欄
  import 'package:saber/components/settings/update_manager.dart';
  import 'package:saber/components/theming/dynamic_material_app.dart';
  import 'package:saber/pages/home/browse.dart';
  import 'package:saber/pages/home/recent_notes.dart';
  import 'package:saber/pages/home/settings.dart';
  import 'package:saber/pages/home/whiteboard.dart';

  class HomePage extends StatefulWidget {//StatefulWidget:好像跟生命週期有關,在某個package裡面
    const HomePage({//const定义的变量的值必须在编译时就确定，而且一旦赋值后不能再被改变
      super.key,
      required this.subpage,
      required this.path,
    });

    final String subpage;
    final String? path;

    @override//一个注解，用于表示一个成员方法是从父类（或接口）继承并重写的
    State<HomePage> createState() => _HomePageState();

    static const String recentSubpage = 'recent';
    static const String browseSubpage = 'browse';
    static const String whiteboardSubpage = 'whiteboard';
    static const String settingsSubpage = 'settings';
    static const List<String> subpages = [
      recentSubpage,
      browseSubpage,
      whiteboardSubpage,
      settingsSubpage
    ];
  }

  class _HomePageState extends State<HomePage> {
    @override
    void initState() {
      DynamicMaterialApp.addFullscreenListener(_setState);//components/theming/dynamic_material_app  //监听器基本上是一个等待特定事件发生的对象或函数。一旦指定的事件发生，监听器就会被触发，执行一些预定义的操作
      super.initState();//super. 子类中调用父类的构造函数、方法或访问父类的属性
      UpdateManager.showUpdateDialog(context);
    }

    void _setState() => setState(() {});//触发重建?

    Widget get body {//在Flutter中，Widget是构建UI的基础?
      switch (widget.subpage) {//subpage上面有宣告
        case HomePage.browseSubpage://browseSubpage上面有宣告,HomePage是父類別
          return BrowsePage(path: widget.path);//path上面有宣告,BrowsePage在browse.dart裡面
        //case HomePage.whiteboardSubpage://whiteboardSubpage上面有宣告
          return const Whiteboard();//看whiteboard.dart
        case HomePage.settingsSubpage://settingsSubpage上面有宣告
          return const SettingsPage();//看settings.dart
        default:
          //return const RecentPage();//預設是RecentPage
          return const BrowsePage();
      }
    }

    @override
    Widget build(BuildContext context) {//建立home的UI時呼叫的 建構子?
      // hide navbar in fullscreen whiteboard
      if (widget.subpage == HomePage.whiteboardSubpage &&
          DynamicMaterialApp.isFullscreen) {
        return body;
      }

      return ResponsiveNavbar(
        selectedIndex: HomePage.subpages.indexOf(widget.subpage),
        body: AdState.adsEnabled
            ? Column(
                children: [
                  Expanded(child: body),
                  SafeArea(
                    top: false,
                    child: BannerAdWidget.adaptive(
                      screenWidth: MediaQuery.sizeOf(context).width,
                    ),
                  ),
                ],
              )
            : body,
      );
    }

    @override
    void dispose() {//銷毀home的UI
      DynamicMaterialApp.removeFullscreenListener(_setState);

      super.dispose();
    }
  }
