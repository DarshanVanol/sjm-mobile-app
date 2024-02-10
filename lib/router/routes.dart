import 'package:go_router/go_router.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/dashboard.dart';
import 'package:sjm/ui/screens/splash.dart';

final routes = [
  GoRoute(
    path: SJMRoutes.splash,
    builder: (context, state) => SplashScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.dashboard,
    builder: (context, state) => DashboardScreen.builder(context, state),
  ),
];
