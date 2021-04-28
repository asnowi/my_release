import 'dart:async';
import 'package:flutter/material.dart';
import 'common/widget/exception/exception.dart';
import 'global.dart';


Future<Null> main() async{
  // 初始化Exception 捕获配置
  ExceptionReportUtil.initExceptionCatchConfig();

  runZonedGuarded(() async{
    await Global.init();
    runApp(MyApp());
  }, (error, stackTrace) {
    // 这个闭包中发生的Exception是捕获不到的
    ExceptionReportChannel.reportException(error, stackTrace);
  }, zoneSpecification: ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      // 记录所有的打印日志
      parent.print(zone, 'line是啥：${line}');
    },
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            child: TextButton(
              onPressed: (){

              }, child: Text('按钮'),
            )
          ),
        ),
      ),
    );
  }
}
