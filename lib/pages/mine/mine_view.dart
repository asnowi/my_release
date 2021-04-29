import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/pages/mine/mine_controller.dart';

class MineView extends GetView<MineController>{

  @override
  MineController get controller => Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('mine'),
    );
  }

}