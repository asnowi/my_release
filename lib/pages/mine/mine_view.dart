import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/res/colors.dart';
import 'package:my_release/common/res/res.dart';
import 'package:my_release/common/router/router.dart';
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
            alignment: Alignment.center,
            height: 0.32.sh,
            color: AppColors.main,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    constraints: BoxConstraints.expand(width: AppDimens.avatarSize,height: AppDimens.avatarSize),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AssetsProvider.imagePath('avatar_default')),fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(AppDimens.avatarSize/2),
                      color: Colors.white
                    ),
                ),
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            width: Get.width,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(height: 300.h),
                ElevatedButton(onPressed: (){
                  Get.toNamed(AppRoutes.login);
                }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.main)
                  ),  
                  child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 12.h),
                  width: 0.82.sw,
                  child: Text('登录'),
                )),
              ],
            ),
          ),
        ),
      ]
    );
  }


}