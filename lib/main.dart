import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sjm/common/pref/preferences.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/firebase_options.dart';
import 'package:sjm/router/router.dart';
import 'package:sjm/ui/screens/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final providerContainer = ProviderContainer();
  Preference.load();
  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => AppRouter(
        builder: (context, router) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'SJM',
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          theme: lightTheme,
          routerConfig: router,
          builder: (context, child) => Material(
            child: child,
          ),
        ),
      ),
      child: const SplashScreen(),
    );
  }
}
