import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/routes/app_pages.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(1000,
                name: TABLET, scaleFactor: 0.9),
            const ResponsiveBreakpoint.autoScale(1200,
                name: DESKTOP, scaleFactor: 0.9),
            const ResponsiveBreakpoint.autoScale(2460,
                name: "4K", scaleFactor: 1.5),
          ],
          background: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          )),
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
      },
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      title: 'Eschool-app',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        primarySwatch: Colors.blue,
      ),
      
      getPages: AppPages.pages,
      initialRoute: AppRoutes.welcome,
      
    );
  }
}
