import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/pages/main/main_controller.dart';

class MainView extends GetView<MainController>{

  @override
  MainController get controller => Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(controller.name),
    );
  }

}