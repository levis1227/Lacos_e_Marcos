import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_theme.dart';
import 'package:projeto_atual/app/routes/routes.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa a formatação de datas em português
  await initializeDateFormatting('pt_BR', null);

  // Trava a orientação do app apenas na vertical
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
          
          // Configurações de localização em português
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          
          initialRoute: RoutesName.splash,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}