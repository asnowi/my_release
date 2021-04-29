import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/pages/home/home_controller.dart';
import 'package:my_release/common/utils/utils.dart';

class HomeView extends GetView<HomeController>{


  final List<Widget> _pageList = [
    // MainView(),
    // MineView()
    Container(alignment: Alignment.center,child: Text('1'),),
    Container(alignment: Alignment.center,child: Text('2'),),
  ];

  final List<String> _textList= [
    '首页',
    '我的',
  ];

  final _defaultIcon = [
    Iconfont.home,
    Iconfont.mine
  ];

  final _selectedIcon = [
    Iconfont.selHome,
    Iconfont.selMine
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        extendBody: false,
        resizeToAvoidBottomInset: false,
        body: _buildPageView(),
        bottomNavigationBar: _buildBottomAppBar(context),
      ),
      onWillPop: () async {
        if(controller.popTime == null || DateTime.now().difference(controller.popTime?? DateTime.now()) > Duration(seconds: 1)){
          //两次点击时间间隔超过1秒则重新计时
          controller.popTime = DateTime.now();
          ToastUtil.show('再按一次退出');
          return false;
        }
        return true;
      },
    );
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      children: _pageList,
    );
  }

  Widget _buildBottomAppBar(BuildContext context) {
    final itemWidth = Get.width / 2;
    final itemHeight = 48.h;
    return BottomAppBar(
      elevation: 4.4,
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: [
          SizedBox(height: itemHeight, width: itemWidth, child: _buildItemBar(0,itemWidth,itemHeight)),
          SizedBox(height: itemHeight, width: itemWidth, child: _buildItemBar(1,itemWidth,itemHeight)),
        ],
      ),
    );
  }


  Widget _buildItemBar(int index,double width,double height){
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: GetBuilder<HomeController>(
            id: controller.ID_BOTTOMAPPBAR,
            builder: (_) =>Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(controller.currentIndex == index ? _selectedIcon[index]: _defaultIcon[index],color: controller.currentIndex == index ? Colors.blue: Colors.black54,size: 19,),
              Text(_textList[index],style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: controller.currentIndex == index ? Colors.blue: Colors.black54,
              )
              ),
            ],
          ),),
        ),
        splashColor: Colors.blue[50],
        focusColor: Colors.blue[50],
        highlightColor: Colors.blue[50],
        onTap: () {
          controller.selectedItem(index);
        },
      ),
    );
  }
}