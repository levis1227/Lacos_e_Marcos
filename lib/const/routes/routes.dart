import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projeto_atual/const/routes/routes_names.dart';
import 'package:projeto_atual/pages/On_Board/on_boarding.dart';

import 'package:projeto_atual/pages/login_signup/login_signup.dart';
import 'package:projeto_atual/pages/login_signup/login.dart';
import 'package:projeto_atual/pages/login_signup/register.dart';
import 'package:projeto_atual/pages/views/homepage.dart';
import 'package:projeto_atual/pages/views/page1.dart';
import 'package:projeto_atual/pages/views/select_profile_page.dart';
import 'package:projeto_atual/pages/forgot_pass.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const Page1(),
          settings: settings,
        );

      case RoutesName.onboarding:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const OnBoarding(),
          settings: settings,
        );

      case RoutesName.loginSignup:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const LoginSignup(),
          settings: settings,
        );

      case RoutesName.login:
        return PageTransition(
          type: PageTransitionType.leftToRight,
          child: const Login(),
          settings: settings,
        );

      case RoutesName.register:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const Register(),
          settings: settings,
        );

      case RoutesName.selectProfile:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const SelectProfilePage(),
          settings: settings,
        );

      case RoutesName.forgotPass:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const ForgotPass(),
          settings: settings,
        );

      case RoutesName.homepage:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const Homepage(),
          settings: settings,
        );

      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const Scaffold(
            body: Center(child: Text("Rota não encontrada")),
          ),
          settings: settings,
        );
    }
  }
}