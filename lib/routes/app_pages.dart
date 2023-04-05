import 'package:eschoolapp/controller/home_controller.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/view/home/components/home_screen.dart';
import 'package:eschoolapp/view/home/main_screen.dart';
import 'package:eschoolapp/view/information/information_screen.dart';
import 'package:eschoolapp/view/welcome/welcome_screen.dart';
import 'package:get/get.dart';


class AppPages {
  AppPages._();

  static final List<GetPage> pages = <GetPage>[

    // AUTH PAGE
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => RegisterScreen(),
    ),

    // APP PAGES
    GetPage(
      name: AppRoutes.home,
      page: () => MainScreeen(),
    
    ),

     GetPage(
      name: AppRoutes.info,
      page: () => InfoScreen(),
    
    ),
   
  ];
}
