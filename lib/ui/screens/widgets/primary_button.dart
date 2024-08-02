import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.bgColor,
    this.textColor,
    this.textSize,
    this.width,
    required this.onPressed,
    this.padding,
    this.icon,
  });

  final String text;
  final Color? bgColor;
  final Color? textColor;
  final double? textSize;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: bgColor ?? colors.primary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? colors.white,
                  fontSize: (textSize ?? 16),
                  fontWeight: FontWeight.w400,
                ),
              ),
              icon != null ? icon! : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
