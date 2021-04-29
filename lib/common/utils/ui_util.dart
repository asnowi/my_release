import 'package:flutter/services.dart';

class UIUtil{

  static Future<void> popApp() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

}