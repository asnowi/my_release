import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final String ID_BOTTOMAPPBAR = 'bottomAppBar';

  DateTime? popTime;



  final PageController pageController = PageController(
      initialPage: 0,
      keepPage: true
  );

  int currentIndex = 0;

  void selectedItem(int index){
    if(currentIndex != index){
      this.currentIndex = index;
      this.pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);//跳转动画
      update([ID_BOTTOMAPPBAR]);
    }
  }
}