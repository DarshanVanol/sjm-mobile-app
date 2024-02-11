import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/gen/assets/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = smjColorsExtension;
    return Scaffold(
        appBar: PrimaryAppBar(title: "Dashboard", leadingBackButton: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    color: color.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    border: Border.all(
                      color: color.primary,
                      width: 1.sp,
                    ),
                  ),
                  child: Column(
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
                        "In Progress",
                        style: TextStyle(
                          color: color.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 4,
              ),
              Row(
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Home Interior design",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        const Icon(Icons.more_vert_rounded)
                      ],
                    ),
                    Text(
                      "Ashwin Kumar",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: color.lightGrey),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: color.lightGrey,
                        ),
                        const Text("14 Nov, 2024 - 10:00 PM")
                      ],
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
