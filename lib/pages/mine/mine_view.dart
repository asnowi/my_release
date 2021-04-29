import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/pages/mine/mine_controller.dart';
import 'package:my_release/common/utils/utils.dart';

class MineView extends GetView<MineController>{

  @override
  MineController get controller => Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: _buildContent(),
    );
  }

  Widget _buildContent(){
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: Text('title'),
          expandedHeight: 200.h,
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.redAccent,
            height: 200.h,
            child: Text('body'),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.deepPurple,
            height: 200.h,
            child: Text('body'),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blueGrey,
            height: 200.h,
            child: Text('body'),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 200.h,
            child: Text('body'),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.green,
            height: 200.h,
            child: Text('body'),
          ),
        ),
      ]
    );
  }


}