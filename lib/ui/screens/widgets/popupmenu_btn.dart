import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';

class PopupMenuBtn extends StatelessWidget {
  PopupMenuBtn({
    Key? key,
    required this.iconData,
    required this.onSelected,
    required this.popMenuList,
    this.padding,
  }) : super(key: key);
  final Widget iconData;
  final void Function(dynamic) onSelected;
  final List<PopupMenuEntry> popMenuList;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: padding ?? EdgeInsets.only(left: 12.w),
      //offset: const Offset(-10, 0),
      color: smjColorsExtension.white,
      icon: iconData,
      onSelected: onSelected,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      itemBuilder: ((context) {
        return popMenuList;
      }),
    );
  }
}
