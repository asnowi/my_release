import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/router/app_routes.dart';
import 'package:my_release/common/utils/utils.dart';

class RouteAuthMiddleware extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route) {
    LogUtils.GGQ('route ->>${route}');
    //判断是否 已登录, 未登录 转到登录页
    Future.delayed(Duration(milliseconds: 1000), () => ToastUtil.show('请先登录！'));
    return RouteSettings(name: AppRoutes.login);
  }
}