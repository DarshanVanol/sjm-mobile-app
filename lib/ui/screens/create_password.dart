import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  static CreateNewPasswordScreen builder(
          BuildContext context, GoRouterState state) =>
      const CreateNewPasswordScreen();
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isShowPassword1 = false;
  bool isShowPassword2 = false;
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: smjColorsExtension.background,
      appBar: PrimaryAppBar(
          title: "Create New Password",
          leadingBackButton: true,
          onBackPress: () => context.pop()),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(children: [
            TextFormField(
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () {
                        isShowPassword1 = !isShowPassword1;
                        setState(() {});
                      },
                      child: Icon(
                        isShowPassword1
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
              obscureText: !isShowPassword1,
              onSaved: (value) => _password = value!,
            ),
            SizedBox(
              height: 24.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () {
                        isShowPassword2 = !isShowPassword2;
                        setState(() {});
                      },
                      child: Icon(
                        isShowPassword2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: smjColorsExtension.lightGrey,
                      )),
                  hintText: "*******",
                  hintStyle: TextStyle(color: smjColorsExtension.lightGrey),
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10.r,
                      ),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always),
              obscureText: !isShowPassword2,
              onSaved: (value) => _confirmPassword = value!,
            ),
            SizedBox(height: 24.h),
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
                // Validate inputs before calling _loginUser
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                // }
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
          ])),
    );
  }
}
