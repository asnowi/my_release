import 'package:get/get.dart';
import 'package:my_release/pages/theme/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
  }

}