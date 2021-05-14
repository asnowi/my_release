import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_release/pages/theme/theme_controller.dart';

class ThemeView extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(onPressed: (){
            Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
          },child: Text('theme'),),
        ),
      ),
    );
  }

}