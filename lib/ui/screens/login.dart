import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/bloc/firebase_service.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/gen/assets/assets.gen.dart';
import 'package:sjm/router/routes_names.dart';

class LoginScreen extends StatefulWidget {
  static LoginScreen builder(BuildContext context, GoRouterState state) =>
      const LoginScreen();
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';

  String _password = '';
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SJMAssets.images.logo.image(
                height: 90.h,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Welcome,",
                style: TextStyle(
                    color: smjColorsExtension.primary,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Login to continue!",
                style: TextStyle(
                    color: smjColorsExtension.lightGrey,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 34.h,
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
              SizedBox(
                height: 24.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          isShowPassword = !isShowPassword;
                          setState(() {});
                        },
                        child: Icon(
                          isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: smjColorsExtension.lightGrey,
                        )),
                    hintText: "*******",
                    hintStyle: TextStyle(color: smjColorsExtension.lightGrey),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10.r,
                        ),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                obscureText: !isShowPassword,
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => context.push(SJMRoutes.resetPassword),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(smjColorsExtension.primary),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)))),
                  minimumSize: MaterialStatePropertyAll(
                    Size(
                      double.infinity,
                      0,
                    ),
                  ),
                ),
                onPressed: () async {
                  // Validate inputs before calling _loginUser
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final auth = AuthService();
                    final result = await auth.signInWithEmailAndPassword(
                        _email.trim(), _password.trim(), context);
                    if (result != null) {
                      if (mounted) {
                        context.go(SJMRoutes.dashboard);
                      }
                    }
                  }
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
              // Optional: Add forgot password link, terms and conditions checkbox
            ],
          ),
        ),
      ),
    );
  }
}
