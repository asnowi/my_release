import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final String ID_ACCOUNT = 'account';
  final String ID_PASSWORD = 'password';
  final String ID_AGREE = 'agree';
  final String ID_LOGIN = 'login';


  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  bool _hasAccountSuffixIcon = false;
  bool get hasAccountSuffixIcon => _hasAccountSuffixIcon;
  void changeHasAccountSuffixIcon(bool b){
    this._hasAccountSuffixIcon = b;
    update([ID_ACCOUNT]);
  }

  bool _hasEye = false;
  bool get hasEye => _hasEye;
  void changeHasEye(bool b){
    this._hasEye = b;
    update([ID_PASSWORD]);
  }

  bool _eyeAction = false;
  bool get eyeAction => _eyeAction;
  void setEyeAction(){
    this._eyeAction = !_eyeAction;
    update([ID_PASSWORD]);
  }

  bool _isAgree = true;
  bool get isAgree => _isAgree;
  void changeAgree(bool b){
    this._isAgree = b;
    update([ID_AGREE]);
  }

  bool _hasLogin = false;
  bool get hasLogin => _hasLogin;
  void changeHasLogin(){
    _hasLogin = _isAgree && _hasAccountSuffixIcon;
    update([ID_LOGIN]);
  }



}