import 'package:get/get.dart';

class ToastUtil{


  /// toast
  static show(String? msg){
    if(msg != null){
      Get.snackbar('', msg);
    }
  }
}