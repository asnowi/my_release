import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/widget/dialog/loading.dart';
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
        SliverToBoxAdapter(
          child: Container(
            color: Colors.blueGrey,
            alignment: Alignment.center,
            height: 180.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AssetsProvider.imagePath('avatar_default')),
              ],
            ),
          ),
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
            child: TextButton(onPressed: (){
              LoadingDialog.show();
            }, child: Text('按钮')),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 200.h,
            child: ImageLoader.load(url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png'),
          ),
        ),
      ]
    );
  }


}