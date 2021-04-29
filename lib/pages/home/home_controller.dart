import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/utils/log_util.dart';

class HomeController extends GetxController{

  final String ID_BOTTOMAPPBAR = 'bottomAppBar';

  DateTime? popTime;

  int currentIndex = 0;

  final PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
  );


  void onPageChanged(int index){
    LogUtils.GGQ('--页面切换：-->${index}');
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    LogUtils.GGQ('--页面onReady：-->${currentIndex}');
    super.onReady();
  }


  void selectedItem(int index){
    if(currentIndex != index){
      this.currentIndex = index;
      this.pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);//跳转动画
      update([ID_BOTTOMAPPBAR]);
    }
  }
}