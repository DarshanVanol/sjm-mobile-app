import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/gen/assets/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  final projectStatus = ["In Progress", "In Review", "On Hold", "Completed"];
  final List<Color> widgetColor = [
    smjColorsExtension.lightBlue,
    smjColorsExtension.lightPurple,
    smjColorsExtension.lightOrange,
    smjColorsExtension.green,
  ];
  @override
  Widget build(BuildContext context) {
    final color = smjColorsExtension;
    return Scaffold(
        backgroundColor: color.background,
        appBar: PrimaryAppBar(title: "Dashboard", leadingBackButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.w,
                    childAspectRatio: 6 / 4,
                    crossAxisSpacing: 8.w,
                  ),
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: widgetColor[index],
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      border: Border.all(
                        color: color.primary,
                        width: 1.sp,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "12",
                            style: TextStyle(
                              color: color.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 32.sp,
                            ),
                          ),
                          Text(
                            projectStatus[index],
                            style: TextStyle(
                              color: color.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: 4,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming meetings",
                      style: TextStyle(
                        color: color.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    SJMAssets.icons.addIcon.svg(
                      height: 24.w,
                      width: 24.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      padding: EdgeInsets.all(12.h),
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
                              const Icon(Icons.more_vert_rounded)
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
                )
              ],
            ),
          ),
        ));
  }
}
