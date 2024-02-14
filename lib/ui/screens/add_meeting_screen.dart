import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/ui/screens/widgets/primary_button.dart';
import 'package:sjm/ui/screens/widgets/textfield_with_label.dart';
import 'package:sjm/ui/screens/widgets/textformfield_without_label.dart';

class AddMettingScreen extends StatefulWidget {
    static AddMettingScreen builder(BuildContext context, GoRouterState state) =>
      const AddMettingScreen();
  const AddMettingScreen({super.key});

  @override
  State<AddMettingScreen> createState() => _AddMettingScreenState();
}

class _AddMettingScreenState extends State<AddMettingScreen> {
  final projectNameController = TextEditingController();
  final clientNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final colors =smjColorsExtension;
    return  Scaffold(
      backgroundColor: colors.background,
      appBar: PrimaryAppBar(title: "Add Meeting", leadingBackButton: true,onBackPress: () => context.pop(),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Column(
          children: [
            InputFieldWithLabel( nameController: projectNameController,label: "Project Name",hintText: "Eg. Design Interior",),
            SizedBox(height: 16.h,),
            InputFieldWithLabel( nameController: clientNameController,label: "Client Name",hintText: "Eg. Manish Sharma",),
            SizedBox(height: 16.h,),
            InputFieldWithLabel( nameController: projectNameController,label: "Schedule Time",hintText: "Eg. 01/01/2024",),
          SizedBox(height: 24.h,),
        PrimaryButton(
                  text: "Add Meeting",
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  onPressed: () async {
                 
                  },
                ),
          ],
        ),
      )
    );
  }
}
