import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/gen/assets/assets.gen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onTapRight;
  final Widget? secLastIc;
  final Widget? thirdLastIc;
  final String? title;
 // final GlobalKey<ScaffoldState> dashboardKey;

  const MainAppBar({
    Key? key,
    this.onTapRight,
    this.secLastIc,
    this.title,
    this.thirdLastIc,
   // required this.dashboardKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return AppBar(
      backgroundColor: colors.background,
      scrolledUnderElevation: 0,
      toolbarHeight: 70.h,
      leadingWidth: 28.w,
      centerTitle: false,
      leading: const SizedBox.shrink(),


      // leading: Padding(
      //   padding:EdgeInsets.only(left: 5.w),
      //   child: IconButton(
      //     onPressed: () {
      //       //trigger the drawer action
      //       //dashboardKey.currentState?.openDrawer();
      //     },
      //     icon: Icon(
      //       Icons.menu,
      //       color: colors.primary,
      //     ),
      //   ),
      // ),
      titleSpacing: 0,
      title: Text(
        title ?? "",
        style: TextStyle(
          color: colors.primary,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
      elevation: 0,
      actions: [
       
        secLastIc ?? const SizedBox(),
         SizedBox(
          width: 16.w,
        ),
        InkWell(
          onTap: onTapRight,
          child: SJMAssets.icons.addIcon.svg(
            height: 24.h,
            width: 24.w,
            fit: BoxFit.fill,
          ),
        ),
         SizedBox(
          width: 16.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
