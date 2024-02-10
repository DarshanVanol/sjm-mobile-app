import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar({
    super.key,
    required String title,
    VoidCallback? onBackPress,
    Widget? trailingIc,
    double? leadingPadding,
    required bool leadingBackButton,
  }) : super(
          backgroundColor: smjColorsExtension.background,
          scrolledUnderElevation: 0,
          leadingWidth: leadingBackButton ? 55.w : 0.w,
          title: Text(
            title,
            style: TextStyle(
                fontSize: leadingBackButton ? 18.sp : 20.sp,
                fontWeight: FontWeight.w600),
          ),
          leading: leadingBackButton
              ? Padding(
                  padding: EdgeInsets.only(left: leadingPadding ?? 20.w),
                  child: InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: onBackPress,
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                )
              : Container(),
          centerTitle: false,
          actions: [
            Padding(padding: EdgeInsets.only(right: 16.w), child: trailingIc)
          ],
        );
}
