import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/router/routes_names.dart';

class ResetPasswordScreen extends StatelessWidget {
  static ResetPasswordScreen builder(
          BuildContext context, GoRouterState state) =>
      const ResetPasswordScreen();
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String _email = '';
    return Scaffold(
      appBar: PrimaryAppBar(title: "Reset Password", leadingBackButton: true),
      body: Column(children: [
        Text(
          "enter the email associated with your account and we will send an email for reset password",
          style:
              TextStyle(fontSize: 14.sp, color: smjColorsExtension.lightGrey),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: "johndoe@email.com",
              hintStyle: TextStyle(color: smjColorsExtension.lightGrey),
              labelText: 'Email address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.r,
                  ),
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always),
          onSaved: (value) => _email = value!,
          validator: (value) {
            RegExp emailRegex =
                RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
            if (value == null || !emailRegex.hasMatch(value!)) {
              return "Invalid email";
            }
            return null;
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(smjColorsExtension.primary),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.r)))),
            minimumSize: const MaterialStatePropertyAll(
              Size(
                double.infinity,
                0,
              ),
            ),
          ),
          onPressed: () {
            context.push(SJMRoutes.emailSent);
            // Validate inputs before calling _loginUser
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
            ),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            ),
          ),
        ),
      ]),
    );
  }
}
