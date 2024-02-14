import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/gen/assets/assets.gen.dart';
import 'package:sjm/router/routes_names.dart';

class EmailSentScreen extends StatelessWidget {
  static EmailSentScreen builder(BuildContext context, GoRouterState state) =>
      const EmailSentScreen();
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: smjColorsExtension.background,
      appBar: PrimaryAppBar(
        title: '',
        leadingBackButton: true,
        onBackPress: () => context.go(SJMRoutes.login),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 54.h,
            ),
            child: InkWell(
                onTap: () => context.push(SJMRoutes.createNewPassword),
                child: SJMAssets.images.email.image(height: 100.h)),
          ),
          Text(
            "Email has been sent!",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "please check your email and click on receive link to reset password ",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 14.sp, color: smjColorsExtension.lightGrey),
          )
        ]),
      ),
    );
  }
}
