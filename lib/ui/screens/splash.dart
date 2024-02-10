import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/gen/assets/assets.gen.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  static SplashScreen builder(BuildContext context, GoRouterState state) =>
      SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.push(SJMRoutes.dashboard);
    }
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
                  color: Color(0xFF404040),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp))
        ]),
      ),
    );
  }
}
