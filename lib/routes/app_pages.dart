import 'package:eschoolapp/controller/home_controller.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/next_step_register.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/view/dashboard/home/home_dashboard_screen.dart';
import 'package:eschoolapp/view/formation/formation_screen.dart';
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

     GetPage(
      name: AppRoutes.nextStepRegister, 
      page: () =>  NextStepRegister(),
    
    ),

     GetPage(
      name: AppRoutes.homeDashboard,
      page: () => DashboardHomeScreen(),
    
    ),
      GetPage(
      name: AppRoutes.formation,
      page: () => FormationScreen(),
    
    ),
   
   
   
  ];
}
