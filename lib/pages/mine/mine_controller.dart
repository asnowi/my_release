import 'package:get/get.dart';
import 'package:my_release/common/utils/log_util.dart';

class MineController extends SuperController{

  final String name = 'mine';

  @override
  void onInit() {
    LogUtils.GGQ('${name} ->> onInit');
    super.onInit();
  }

  @override
  void onReady() {
    LogUtils.GGQ('${name} ->> onReady');
    super.onReady();
  }


  @override
  void onClose() {
    LogUtils.GGQ('${name} ->> onClose');
    super.onClose();
  }

  @override
  void dispose() {
    LogUtils.GGQ('${name} ->> dispose');
    super.dispose();
  }

  @override
  void onDetached() {
    LogUtils.GGQ('${name} ->> onDetached');
  }

  @override
  void onInactive() {
    LogUtils.GGQ('${name} ->> onInactive');
  }

  @override
  void onPaused() {
    LogUtils.GGQ('${name} ->> onPaused');
  }

  @override
  void onResumed() {
    LogUtils.GGQ('${name} ->> onResumed');
  }
}