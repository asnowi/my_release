import 'package:get/get.dart';
import 'package:my_release/pages/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }

}