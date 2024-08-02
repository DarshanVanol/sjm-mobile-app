import 'package:go_router/go_router.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/create_password.dart';
import 'package:sjm/ui/screens/add_meeting_screen.dart';
import 'package:sjm/ui/screens/dashboard.dart';
import 'package:sjm/ui/screens/email_sent.dart';
import 'package:sjm/ui/screens/expense/add_expense_screen.dart';
import 'package:sjm/ui/screens/expense/expense_detail_screen.dart';
import 'package:sjm/ui/screens/login.dart';
import 'package:sjm/ui/screens/project/add_project_screen.dart';
import 'package:sjm/ui/screens/project/project_details_screen.dart';
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
    path: SJMRoutes.emailSent,
    builder: (context, state) => EmailSentScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.createNewPassword,
    builder: (context, state) =>
        CreateNewPasswordScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.addMettingScreen,
    builder: (context, state) => AddMettingScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.projectDetailsScreen,
    builder: (context, state) => ProjectDetailsScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.addProjectScreen,
    builder: (context, state) => AddProjectScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.addExpenseScreen,
    builder: (context, state) => AddExpenseScreen.builder(context, state),
  ),
  GoRoute(
    path: SJMRoutes.expenseDetailScreen,
    builder: (context, state) => ExpenseDetailsScreen.builder(context, state),
  ),
];
