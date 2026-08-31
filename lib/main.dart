import 'package:flutter/material.dart';
import 'package:projeto_atual/const/routes/routes.dart';
import 'package:projeto_atual/const/routes/routes_names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const Medics());
}

class Medics extends StatelessWidget {
  const Medics({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          
          // Define a rota inicial como a Splash/Page1
          initialRoute: RoutesName.splash,
          
          // Conecta o gerenciador de rotas dinâmico com o PageTransition
          onGenerateRoute: Routes.generatedRoute,
        );
      },
    );
  }
}