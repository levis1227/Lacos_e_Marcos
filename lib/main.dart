import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:projeto_atual/app/core/theme/app_theme.dart';
import 'package:projeto_atual/app/routes/routes.dart'; 
import 'package:projeto_atual/app/routes/routes_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Laços e Marcos',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          initialRoute: RoutesName.splash,
          onGenerateRoute: AppRoutes.onGenerateRoute, 
        );
      },
    );
  }
}