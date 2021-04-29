import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/pages/home/home_controller.dart';

class HomeView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('home'),
      ),
    );
  }

}