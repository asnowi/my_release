
import 'package:get/get.dart';
import 'package:my_release/common/router/router.dart';
import 'package:my_release/pages/home/home_binding.dart';
import 'package:my_release/pages/home/home_view.dart';
import 'package:my_release/pages/login/login_binding.dart';
import 'package:my_release/pages/login/login_view.dart';
import 'package:my_release/pages/splash/splash_view.dart';
import 'package:my_release/pages/welcome/welcome_binding.dart';
import 'package:my_release/pages/welcome/welcome_view.dart';
class AppPages {
  /// 路由初始页
  static const INITIAL = AppRoutes.splash;


  //页面跳转动画时长
  static const Duration _transitionDuration = Duration(milliseconds: 300);

  /// 路由集合
  static final List<GetPage> routes = [

    GetPage(
        name: AppRoutes.splash,
        page: () => SplashView(),
    ),

    GetPage(
      name: AppRoutes.welcome,
      binding: WelcomeBinding(),
      page: () => WelcomeView(),
      transition: Transition.fadeIn,
      // transitionDuration: _transitionDuration,
    ),

    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => HomeView(),
      transition: Transition.fadeIn,
      // transitionDuration: _transitionDuration,
      // middlewares: _middlewares,
    ),

    GetPage(
      name: AppRoutes.login,
      binding: LoginBinding(),
      page: () => LoginView(),
      // transition: Transition.downToUp,
      transitionDuration: _transitionDuration,
    ),
  ];

  /// 找不到去登录页
  static final unknownRoute = GetPage(
    name: AppRoutes.login,
    binding: LoginBinding(),
    page: () => LoginView(),
    transitionDuration: _transitionDuration,
  );


  static final List<GetMiddleware> _middlewares  = [
    RouteAuthMiddleware(),
  ];

}