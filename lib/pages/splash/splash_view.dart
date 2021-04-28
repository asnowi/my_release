import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/utils/utils.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.blue,
          child: Image.asset(AssetsProvider.imagePath('pic_splash',type: 'jpg'),fit: BoxFit.fill)
      ),
    );
  }
}
