
import 'package:get/get.dart';
import 'package:my_release/common/router/router.dart';
import 'package:my_release/pages/login/login_view.dart';
import 'package:my_release/pages/splash/splash_view.dart';
class AppPages {
  static const INITIAL = AppRoutes.splash;

  static final List<GetPage> routes = [

    GetPage(
        name: AppRoutes.splash,
        page: () => SplashView(),
    ),

  ];

  // 找不到去登录页
  static final unknownRoute = GetPage(
    name: AppRoutes.login,
    page: () => LoginView(),
    transitionDuration: Duration(milliseconds: 300),
  );
}