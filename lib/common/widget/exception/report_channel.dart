import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_release/common/utils/log_util.dart';

class ExceptionReportChannel {
  static const MethodChannel _channel =
  const MethodChannel('my_exception_channel');

  // 上报异常
  static reportException(dynamic error, dynamic stack) {
    // LogUtils.GGQ('捕获的异常类型 >>> : ${error.runtimeType}');
    LogUtils.GGQ('捕获的异常信息 >>> : $error');
    // LogUtils.GGQ('捕获的异常堆栈 >>> : $stack');

    Map reportMap = {
      'type': "${error.runtimeType}",
      'title': error.toString(),
      'description': stack.toString()
    };

    // 得使用这个
    LogUtils.GGQ(jsonEncode(reportMap));

    _channel.invokeListMethod('reportException', reportMap);
  }
}