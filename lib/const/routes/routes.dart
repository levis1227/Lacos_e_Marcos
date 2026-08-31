import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projeto_atual/Pages/Login-Signup/login.dart';
import 'package:projeto_atual/Pages/Login-Signup/login_signup.dart';
import 'package:projeto_atual/Pages/Login-Signup/register.dart';
import 'package:projeto_atual/Pages/On_Board/on_boarding.dart';
import 'package:projeto_atual/Pages/Views/Homepage.dart';
import 'package:projeto_atual/Pages/Views/Page1.dart';
import 'package:projeto_atual/Pages/Views/SelectProfilePage.dart';
import 'package:projeto_atual/Pages/forgot_pass.dart';
import 'package:projeto_atual/const/routes/routes_names.dart';


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
          child: const on_boarding(),
          settings: settings,
        );

      case RoutesName.loginSignup:
        return PageTransition(
          type: PageTransitionType.bottomToTop, // Animação de baixo para cima
          child: const login_signup(),
          settings: settings,
        );

      case RoutesName.login:
        return PageTransition(
          type: PageTransitionType.leftToRight, // Animação da esquerda para a direita
          child: const login(),
          settings: settings,
        );

      case RoutesName.register:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const register(),
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
          child: const forgot_pass(),
          settings: settings,
        );

      case RoutesName.homepage:
        return PageTransition(
          type: PageTransitionType.fade,
          child: Homepage(),
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