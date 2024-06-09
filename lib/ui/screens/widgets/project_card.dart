import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/ui/screens/widgets/popupmenu_btn.dart';

class ProjectCard extends StatelessWidget {
   ProjectCard({super.key, required this.onCardTap});
 final void Function() onCardTap;
 final List<PopupMenuEntry> _popupMenuList = [ PopupMenuItem(
        value: 1,
        height: 20,
        child: Text(
          "Edit",
          style: TextStyle(
            color: smjColorsExtension.lightGrey,
            fontSize: 14.sp,
          ),
        ),
      ),
      PopupMenuItem(
        value: 2,
        height: 30,
        child: Text(
          "Delete",
          style: TextStyle(
            color: smjColorsExtension.lightGrey,
            fontSize: 14.sp,
          ),
        ),
      ),];
  @override
  Widget build(BuildContext context) {
    final color = smjColorsExtension;
    return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: InkWell(
                    onTap: onCardTap,
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w,right: 8.w,bottom: 8.h),
                      decoration: BoxDecoration(
                        color: color.white,
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Home Interior design",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                             // const Icon(Icons.more_vert_rounded)
                              PopupMenuBtn(
                      iconData: Icon(
                        Icons.more_vert_rounded,
                        color: smjColorsExtension.primary,
                      ),
                      onSelected: (value) {
                        if (value == 1) {
                          //onEditTap();
                        } else if (value == 2) {
                        
                        }
                      },
                      popMenuList: _popupMenuList,
                    ),
                                   
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Ashwin Kumar",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: color.lightGrey),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                size: 18.sp,
                                Icons.calendar_today_outlined,
                                color: color.lightGrey,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "14 Nov, 2024 - 10:00 PM",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: color.lightGrey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
  ;
  }
}