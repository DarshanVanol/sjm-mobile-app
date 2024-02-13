import 'package:go_router/go_router.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/dashboard.dart';
import 'package:sjm/ui/screens/email_sent.dart';
import 'package:sjm/ui/screens/login.dart';
import 'package:sjm/ui/screens/reset_password.dart';
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
  GoRoute(
    path: SJMRoutes.login,
    builder: (context, state) => LoginScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.resetPassword,
    builder: (context, state) => ResetPasswordScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.resetPassword,
    builder: (context, state) => EmailSentScreen.builder(context, state),
  ),
];
