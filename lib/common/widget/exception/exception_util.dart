import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_release/common/config/config.dart';
import 'package:my_release/common/utils/log_util.dart';
import 'package:my_release/common/utils/ui_util.dart';

/// 工具类
class ExceptionReportUtil {
  // 比较巧妙的一种方式判定是否是debug模式
  static bool get isInDebugMode {
    bool inDebugMode = false;
    // 如果debug模式下会触发赋值，只有在debug模式下才会执行assert
    assert(inDebugMode = true);
    return inDebugMode;
  }

  // 初始化异常捕获配置
  static void initExceptionCatchConfig() {
    // framework异常捕获，转发到当前的 Zone
    FlutterError.onError = (FlutterErrorDetails details) async {
      // debug模式
      if (ExceptionReportUtil.isInDebugMode) {
        // 打印到控制台
        FlutterError.dumpErrorToConsole(details);
        // release模式
      } else {
        // 转发到zone
        Zone.current.handleUncaughtError(details.exception, details.stack?? StackTrace.empty);
      }
    };

    // 重写 ErrorWidget 的builder，显示地优雅一些
    ErrorWidget.builder = (FlutterErrorDetails details) {
      LogUtils.GGQ('错误widget详细的错误信息为：' + details.toString());

      return MaterialApp(
        title: '页面错误',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('~页面出错啦~',style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            leading: IconButton(
              splashRadius: Config.backRadius,
              onPressed: () {
                UIUtil.popApp();
              },
              icon: Icon(
                Icons.close_sharp,
                color: Colors.white,
              ),
            ),
          ),
          body: _buildError(details),
        ),
      );
    };
  }

  // 创建错误widget
  static Widget _buildError(dynamic details) {
    // 正确代码
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            details.toString(),
            style: const TextStyle(color: Colors.black54),
          )
        ),
      ),
    );
  }
}