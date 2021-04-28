
import 'package:my_release/common/widget/dialog/loading.dart';

class LoadingDialog{

  static show(){
    if(!EasyLoading.isShow){
      EasyLoading.show(status: 'loading...');
    }
  }

  static dismiss(){
    if(EasyLoading.isShow){
      EasyLoading.dismiss();
    }
  }

}