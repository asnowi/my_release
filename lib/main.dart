import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_release/common/res/res.dart';
import 'package:my_release/common/widget/refresh/index.dart';
import 'common/router/router.dart';
import 'common/widget/dialog/loading.dart';
import 'common/widget/exception/exception.dart';
import 'global.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

Future<Null> main() async{
  // 初始化Exception 捕获配置
  ExceptionReportUtil.initExceptionCatchConfig();

  runZonedGuarded(() async{
    await Global.init().then((value) => runApp(MyApp()));
  }, (error, stackTrace) {
    // 这个闭包中发生的Exception是捕获不到的
    ExceptionReportChannel.reportException(error, stackTrace);
  }, zoneSpecification: ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      // 记录所有的打印日志
      parent.print(zone, '记录所有的打印日志：${line}');
    },
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 734),
      builder: () =>RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
        footerBuilder:  () => ClassicFooter(),        // Configure default bottom indicator
        headerTriggerDistance: 80.0,        // header trigger refresh trigger distance
        springDescription: SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // custom spring back animate,the props meaning see the flutter api
        maxOverScrollExtent :100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        maxUnderScrollExtent:0, // Maximum dragging range at the bottom
        enableScrollWhenRefreshCompleted: true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        enableLoadingWhenFailed : true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
        hideFooterWhenNotFull: false, // Disable pull-up to load more functionality when Viewport is less than one screen
        enableBallisticLoad: true, // trigger load more by BallisticScrollActivity
        child: GetMaterialApp(
          navigatorKey: navigatorKey,
          title: AppStrings.APP_TITLE,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          // logWriterCallback: Logger.write,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          unknownRoute: AppPages.unknownRoute,
          // locale: TranslationService.locale,
          // fallbackLocale: TranslationService.fallbackLocale,
          // translations: TranslationService(),
          // builder: EasyLoading.init(),
          builder: EasyLoading.init()
        ),
      ),
    );  }
}
