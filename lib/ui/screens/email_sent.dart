import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';

class EmailSentScreen extends StatelessWidget {
  static EmailSentScreen builder(BuildContext context, GoRouterState state) =>
      const EmailSentScreen();
  const EmailSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: '', leadingBackButton: true),
      body: Column(children: [
        Icon(
          Icons.mail_outline_rounded,
          size: 50.h,
        ),
        Text(
          "email has been sent!",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
        Text(
          "please check your email and click on receive link to reset password ",
          style:
              TextStyle(fontSize: 14.sp, color: smjColorsExtension.lightGrey),
        )
      ]),
    );
  }
}
