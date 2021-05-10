import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/db/db.dart';
import 'package:my_release/common/utils/log_util.dart';
import 'package:my_release/common/utils/toast.dart';
import 'package:my_release/global.dart';

class LoginController extends GetxController{

  final String ID_ACCOUNT = 'account';
  final String ID_PASSWORD = 'password';
  final String ID_AGREE = 'agree';

  final String ID_LOGIN ='login';



  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool _hasAccountSuffixIcon = false;
  bool get hasAccountSuffixIcon => _hasAccountSuffixIcon;
  void changeHasAccountSuffixIcon(bool b){
    this._hasAccountSuffixIcon = b;
    update([ID_ACCOUNT]);
    changeLogin();
  }

  bool _hasPasswordSuffixIcon = false;
  bool get hasPasswordSuffixIcon => _hasPasswordSuffixIcon;
  void changeHasPasswordSuffixIcon(bool b){
    this._hasPasswordSuffixIcon = b;
    update([ID_PASSWORD]);
    changeLogin();
  }

  bool _hasEye = true;
  bool get hasEye => _hasEye;
  void changeHasEye(){
    this._hasEye = !this._hasEye;
    update([ID_PASSWORD]);
    changeLogin();
  }


  bool _isAgree = true;
  bool get isAgree => _isAgree;
  void changeAgree(bool b){
    this._isAgree = b;
    update([ID_AGREE]);
    changeLogin();
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  void changeLogin(){
    this._isLogin = this._isAgree && this._hasAccountSuffixIcon && this._hasPasswordSuffixIcon;
    update([ID_LOGIN]);
  }

  void loginSubmit() async{
    User user = User()
      ..phone = '13717591366'
      ..token = 'tokenxx'
      ..userId = 'userId001'
      ..avatarImg = 'http://p1.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg';

    final result = await Global.dbUtil?.userBox?.add(user);
    LogUtils.GGQ('reslut=>${result}');
    if(result != null && result >= 0) {
      ToastUtil.show('登录成功！');
      Global.userInfo = user;
      Get.back(result: true);
    }else {
      ToastUtil.show('登录xx！');
    }
  }

}