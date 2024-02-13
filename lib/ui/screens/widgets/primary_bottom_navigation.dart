
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/gen/assets/assets.gen.dart';


class PrimaryBottomNavigation extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const PrimaryBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PrimaryBottomNavigation> createState() => _PrimaryBottomNavigationState();
}

class _PrimaryBottomNavigationState extends State<PrimaryBottomNavigation> {
  //final SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper(Preference());

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 18.w,
      ),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(50.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(0);
              });
            },
            child: _menuItem(
              icon: SJMAssets.icons.home.svg(
                width: 30.w,
                height: 30.w,
                color: widget.currentIndex == 0 ? colors.primary : colors.lightGrey,
              ),
              isCurrentIndex: widget.currentIndex == 0,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(1);
              });
            },
            child: _menuItem(
              icon: SJMAssets.icons.product.svg(
                color: widget.currentIndex == 1 ? colors.primary : colors.lightGrey,
              ),
              isCurrentIndex: widget.currentIndex == 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(2);
              });
            },
            child: _menuItem(
              icon: SJMAssets.icons.order.svg(
                width: 24.w,
                height: 24.w,
                fit: BoxFit.cover,
                color: widget.currentIndex == 2 ? colors.primary : colors.lightGrey,
              ),
              isCurrentIndex: widget.currentIndex == 2,
            ),
          ),
          // sharedPreferenceHelper.roleId == UserRolesConst.stocks ||
          //         sharedPreferenceHelper.roleId == UserRolesConst.admin
          //     ?
          GestureDetector(
            onTap: () {
              setState(() {
                widget.onTap(3);
              });
            },
            child: _menuItem(
              icon: SJMAssets.icons.customer.svg(
                color: widget.currentIndex == 3 ? colors.primary : colors.lightGrey,
              ),
              isCurrentIndex: widget.currentIndex == 3,
            ),
          )
          // : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _menuItem({
    required Widget icon,
    required bool isCurrentIndex,
  }) {
    return SizedBox(
      height: 40.w,
      width: 40.w,
      child: Container(
        height: 34.w,
        width: 34.w,
        decoration: BoxDecoration(
          color: isCurrentIndex ? smjColorsExtension.white : Colors.transparent, // Update background color
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: UnconstrainedBox(
          child: icon,
        ),
      ),
    );
  }
}
