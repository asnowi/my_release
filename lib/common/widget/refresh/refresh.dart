
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_release/common/utils/utils.dart';
import 'package:my_release/common/widget/refresh/index.dart';

class Refresh extends StatelessWidget {

  final RefreshController? controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final Widget? content;
  final bool enablePullDown;
  final bool enablePullUp;

  const Refresh({@required this.controller, @required this.onRefresh, @required this.onLoading, @required this.content,this.enablePullDown = true,this.enablePullUp = true});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      context: context,
      child: RefreshConfiguration.copyAncestor(
        context: context,
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          child: SmartRefresher(
            controller: this.controller!,
            enablePullDown: this.enablePullDown,
            enablePullUp: this.enablePullUp,
            header: _buildHeader(),
            footer: _buildFooter(),
            onRefresh: this.onRefresh,
            onLoading: this.onLoading,
            child: this.content,
          ),
        ),
        enableLoadingWhenFailed: true,
        maxUnderScrollExtent: 100.0,
        footerTriggerDistance: -45.0,
      ),
      enableLoadingWhenFailed: true,
      footerTriggerDistance: -60.0,
    );
  }

  Widget _buildTextIndicator(String statusStr) {
    return Container(
      child: Stack(
        children: [
          Lottie.asset(
            AssetsProvider.lottiePath('refresh'),
            // AssetsProvider.lottiePath('loadingYellow'),
            width: 96,
            alignment: Alignment.center,
          ),
          Positioned(
            bottom: -2,
            left: 24,
            right: 0,
            child: Text(
              statusStr,
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildHeader(){
    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget body = _buildTextIndicator('loading');
        if (mode == RefreshStatus.canRefresh) {
          body = _buildTextIndicator("'????????????");
        } else if (mode == RefreshStatus.refreshing) {
          body = _buildTextIndicator('?????????...');
        } else if (mode == RefreshStatus.idle) {
          body = _buildTextIndicator('????????????');
        } else if (mode == RefreshStatus.completed) {
          body = _buildTextIndicator('????????????');
        }
        return Container(
          padding: EdgeInsets.only(top: 6,bottom: 10),
          height: 76,
          child: Center(
            child: body,
          ),
        );
      },
    );
  }

  Widget _buildFooter(){
    return CustomFooter(
      loadStyle: LoadStyle.ShowWhenLoading,
      builder: (BuildContext context, LoadStatus? mode){
        Widget body;
        if (mode == LoadStatus.idle) {
          body = Text('????????????', style: TextStyle(fontSize: 12));
        } else if (mode == LoadStatus.loading) {
          body = Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.grey),
                    strokeWidth: 1.6,
                  ),
                  width: 12,
                  height: 12,
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Text('?????????...', style: TextStyle(fontSize: 12))
              ],
            ),
          );
        } else if (mode == LoadStatus.failed) {
          body = Text('??????????????????????????????', style: TextStyle(fontSize: 12));
        } else if (mode == LoadStatus.canLoading) {
          body = Text('??????,????????????!', style: TextStyle(fontSize: 12));
        } else {
          body = Text('?????????????????????!', style: TextStyle(fontSize: 12));
        }
        return Container(
          height: 55.0,
          padding: EdgeInsets.only(top: 6,bottom: 10),
          child: Center(child: body),
        );
      },
    );
  }

}
