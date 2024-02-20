import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';

class ProjectDetailsScreen extends StatelessWidget {
   static ProjectDetailsScreen builder(BuildContext context, GoRouterState state) =>
      const ProjectDetailsScreen();
  const ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PrimaryAppBar(title: "Project Details", leadingBackButton: true,onBackPress: () => context.pop(),),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child:SizedBox())

    );
  }
}