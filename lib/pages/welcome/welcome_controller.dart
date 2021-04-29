import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/router/router.dart';
import 'package:my_release/common/utils/log_util.dart';
import 'package:my_release/global.dart';

class WelcomeController extends GetxController{

  final PageController pageController = PageController(
    initialPage: 0,
    //viewportFraction: 1,
    keepPage: true,
  );

  @override
  void onInit() {
    LogUtils.GGQ('onInit-->');
   // Global.hasHome = true;
   // StorageUtil().setBool(SaveInfoKey.HAS_HOME, true);
    LogUtils.GGQ('欢迎页-->${Global.hasHome}');
    super.onInit();
  }

  @override
  void onReady() {
    LogUtils.GGQ('onReady-->');
    super.onReady();
  }

  void launchHome(){
    Get.offAndToNamed(AppRoutes.home);
  }
}