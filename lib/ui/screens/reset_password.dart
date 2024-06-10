import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/bloc/firebase_service.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';

class ResetPasswordScreen extends StatelessWidget {
  static ResetPasswordScreen builder(
          BuildContext context, GoRouterState state) =>
      ResetPasswordScreen();
  ResetPasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String email = '';
    return Scaffold(
      backgroundColor: smjColorsExtension.background,
      appBar: PrimaryAppBar(
        title: "Reset Password",
        leadingBackButton: true,
        onBackPress: () => context.pop(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(children: [
          SizedBox(
            height: 29.h,
          ),
          Text(
            "enter the email associated with your account and we will send an email for reset password",
            style:
                TextStyle(fontSize: 14.sp, color: smjColorsExtension.lightGrey),
          ),
          SizedBox(
            height: 25.h,
          ),
          Form(
            key: _formKey,
            child: TextFormField(
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
              onSaved: (value) => email = value!,
              validator: (value) {
                RegExp emailRegex =
                    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                if (value == null || !emailRegex.hasMatch(value)) {
                  return "Invalid email";
                }
                return null;
              },
            ),
          ),
          SizedBox(
            height: 25.h,
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final auth = AuthService();
                await auth.resetPassword(email, context);
                // Call the reset password function
              }
              // Validate inputs before calling _loginUser
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
