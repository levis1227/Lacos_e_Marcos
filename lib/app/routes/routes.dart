import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projeto_atual/app/modules/auth/pages/forgot_pass_page.dart';
import 'package:projeto_atual/app/modules/auth/pages/login_page.dart';
import 'package:projeto_atual/app/modules/auth/pages/login_signup_page.dart';
import 'package:projeto_atual/app/modules/auth/pages/register_page.dart';
import 'package:projeto_atual/app/modules/home/pages/homepage.dart';
import 'package:projeto_atual/app/modules/link_baby/pages/link_baby_page.dart';
import 'package:projeto_atual/app/modules/memorias/pages/memories_screen.dart';
import 'package:projeto_atual/app/modules/onboarding/pages/onboarding_page.dart';
import 'package:projeto_atual/app/modules/orientacoes/pages/orientations_screen.dart';
import 'package:projeto_atual/app/modules/onboarding/pages/splash_page.dart';
import 'package:projeto_atual/app/modules/profile/pages/select_profile_page.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const SplashPage(),
          settings: settings,
        );

      case RoutesName.onboarding:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const OnboardingPage(),
          settings: settings,
        );

      case RoutesName.loginSignup:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          child: const LoginSignupPage(),
          settings: settings,
        );

      case RoutesName.login:
        return PageTransition(
          type: PageTransitionType.leftToRight,
          child: const LoginPage(),
          settings: settings,
        );

      case RoutesName.register:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const RegisterPage(),
          settings: settings,
        );

      case RoutesName.linkBaby:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const LinkBabyPage(),
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
          child: const ForgotPasswordPage(),
          settings: settings,
        );

      case RoutesName.homepage:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const Homepage(),
          settings: settings,
        );

      case RoutesName.memories:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          // Nome do bebê pode ser enviado em `arguments` (String)
          child: MemoriesScreen(
            babyName: settings.arguments as String? ?? 'seu bebê',
          ),
          settings: settings,
        );

      case RoutesName.orientations:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const OrientationsScreen(),
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
