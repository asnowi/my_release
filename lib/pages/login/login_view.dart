import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_release/common/res/res.dart';
import 'package:my_release/common/utils/utils.dart';
import 'package:my_release/pages/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          splashRadius: AppDimens.backRadius,
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 20,
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                ToastUtil.show('帮助');
              },
              child: Text('帮助',
                  style: TextStyle(color: Colors.black, fontSize: 14.sp)))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: Get.height - Get.statusBarHeight,
            child: Flex(
              direction: Axis.vertical,
              children: [
                _buildTop(),
                _buildContent(),
                _buildAgreement()
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _buildTop(){
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.center,
          child: Text('平安电车',style: TextStyle(
              fontSize: 26,
              color: Colors.black87,
              fontWeight: FontWeight.bold
          ),)),
    );
  }

  Widget _buildContent(){
    return Container(
      child: Column(
        children: [
          _buildInputAccount(),
          SizedBox(height: 20.h),
          _buildInputPassword(),
          SizedBox(height: 30.h),
          _buildLogin(),
          _buildForgotPassword(),
        ],
      ),
    );
  }

  Widget _buildForgotPassword(){
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: 0.82.sw
      ),
      child: Container(
        alignment: Alignment.centerRight,
        child: TextButton(onPressed: (){
          ToastUtil.show('忘记密码');
        }, child: Text('忘记密码?',style: TextStyle(fontSize: 12,color: Colors.grey),)),
      ),
    );
  }

  Widget _buildInputAccount(){
    final String _phone = '13717591366';
    if(_phone != null && _phone.isNotEmpty){
       controller.accountController.text = _phone;
       controller.changeHasAccountSuffixIcon(true);
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 48.h,
          maxWidth: 0.82.sw
      ),
      child: GetBuilder<LoginController>(
        id: controller.ID_ACCOUNT,
        builder: (_) =>TextField(
        controller: controller.accountController,
        maxLines: 1,
        autocorrect: true,//是否自动更正
        autofocus: true,//是否自动对焦
        textAlign: TextAlign.start,//文本对齐方式
        keyboardType: TextInputType.phone,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          hintText: '请输入手机号',
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          prefixIcon: const Icon(Iconfont.phone,color: Colors.blue,size: 16),
          suffixIcon: controller.hasAccountSuffixIcon? IconButton(icon: Icon(Iconfont.close,color: Colors.blue,size: 16), onPressed: (){
            controller.accountController.clear();
            controller.changeHasAccountSuffixIcon(false);
          }):null,
          // contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        onChanged: (text) {//内容改变的回调
          controller.changeHasAccountSuffixIcon(text.isNotEmpty);
        },
        onSubmitted: (text) {//内容提交(按回车)的回调
          LogUtils.GGQ('phone onSubmitted:${text}');
        },
      )
      ),
    );
  }
  Widget _buildInputPassword(){
      return ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: 48.h,
            maxWidth: 0.82.sw
        ),
        child: GetBuilder<LoginController>(
          id: controller.ID_PASSWORD,
          builder: (_) =>TextField(
            controller: controller.passwordController,
            maxLines: 1,
            autocorrect: true,//是否自动更正
            // autofocus: true,//是否自动对焦
            textAlign: TextAlign.start,//文本对齐方式
            obscureText: controller.hasEye,//是否是密码
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 4),
              hintText: '请输入密码',
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              prefixIcon: const Icon(Iconfont.pwd,color: Colors.blue,size: 16),
                suffixIcon: controller.hasPasswordSuffixIcon? IconButton(
                  icon: controller.hasEye? Icon(Iconfont.eyeHide,color: Colors.blue,size: 16): Icon(Iconfont.eyeShow,color: Colors.blue,size: 16), onPressed: (){
                  controller.changeHasEye();
                }):null,
              // contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.grey[100],
            ),
            onChanged: (text) {//内容改变的回调
              LogUtils.GGQ('密码->${text}');
              controller.changeHasPasswordSuffixIcon(text.isNotEmpty);
            },
            onSubmitted: (text) {//内容提交(按回车)的回调
              LogUtils.GGQ('password onSubmitted:${text}');
            },
          ),
        ),
      );
  }

  Widget _buildLogin(){
    return Container(
      width: 0.82.sw ,
      child: GetBuilder<LoginController>(
        id: controller.ID_LOGIN,
        builder: (_) =>ElevatedButton(onPressed: controller.isLogin? (){
          if(!controller.isAgree){
            ToastUtil.show('请您认真阅读并同意《用户使用协议》及《隐私条款》');
            return;
          }

          if(!RegexUtils.isPhone(controller.accountController.text)){
            ToastUtil.show('您输入的手机号格式不正确');
            return;
          }
          controller.loginSubmit();
        }:null,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states){
                  if(states.contains(MaterialState.disabled)){
                    return Colors.blue[100];
                  }
                  return Colors.blue;
                })
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text('登录',style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            )
        ),
      ),
    );
  }

  Widget _buildAgreement(){
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: InkWell(
                child: GetBuilder<LoginController>(
                  id: controller.ID_AGREE,
                  builder: (_) =>controller.isAgree? Icon(Icons.radio_button_on,size: 18,color: Colors.blue,):Icon(Icons.radio_button_on,size: 18,color: Colors.grey,),
                ),
                onTap: (){
                  controller.changeAgree(!controller.isAgree);
                },
                splashColor: Colors.blue[50],
                focusColor: Colors.blue[50],
                highlightColor: Colors.blue[50],
              ),
            ),

            RichText(
              text: TextSpan(
                  text: '我已认真阅读并同意',
                  style: const TextStyle(color: Colors.black, fontSize: 10),
                  children: [
                    TextSpan(
                        text: '《用户使用协议》',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer() ..onTap = () {
                          ToastUtil.show('用户使用协议');
                        }
                    ),
                    TextSpan(
                        text: '及',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: '《隐私条款》',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer() ..onTap = () {
                            ToastUtil.show('隐私条款');
                          }
                    ),
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
