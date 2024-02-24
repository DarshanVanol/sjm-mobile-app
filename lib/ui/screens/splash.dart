import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/bloc/providers.dart';
import 'package:sjm/common/pref/helper.dart';
import 'package:sjm/gen/assets/assets.gen.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/dashboard.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static SplashScreen builder(BuildContext context, GoRouterState state) =>
      SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    final _pref = ref.read(sharedPrefHelperProvider);
    final isLoggedIn = _pref.isLoggedIn;
    print("isLoggedin: $isLoggedIn");
    if (isLoggedIn) {
      final user = _pref.user;
      print("user: $user");
      if (user != null) {
        ref.read(userProvider.notifier).state = user;
      }

      if (mounted) {
        context.push(SJMRoutes.dashboard);
      }
    } else {
      if (mounted) {
        context.push(SJMRoutes.login);
      }
    }
    //if (jwt != null) {
    // if (mounted) {
    //   context.push(SJMRoutes.dashboard);
    // }

    // } else {
    //   if (mounted) {
    //     context.push(SJMRoutes.login);
    //   }
    // }
    // final jwt = _preferenceHelper.authToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SJMAssets.images.logo.image(
            height: 143.h,
          ),
          Text(
            "SJM",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 48.sp),
          ),
          Text("Design Consultant",
              style: TextStyle(
                  color: const Color(0xFF404040),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp))
        ]),
      ),
    );
  }
}
