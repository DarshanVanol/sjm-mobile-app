import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/ui/screens/project/project_screen.dart';
import 'package:sjm/ui/screens/widgets/popupmenu_btn.dart';

class ProjectDetailsScreen extends StatefulWidget {
  static ProjectDetailsScreen builder(
          BuildContext context, GoRouterState state) =>
      ProjectDetailsScreen();
  ProjectDetailsScreen({super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  final List<PopupMenuEntry> _popupMenuList = [
    PopupMenuItem(
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
    ),
  ];

  final List<StatusModel> status = [
    StatusModel(
      name: "In Progress",
      color: smjColorsExtension.lightBlue,
      isSelected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final color = smjColorsExtension;
    return Scaffold(
        backgroundColor: color.background,
        appBar: PrimaryAppBar(
          title: "Project Details",
          leadingBackButton: true,
          onBackPress: () => context.pop(),
          trailingIc: PopupMenuBtn(
            iconData: Icon(
              Icons.more_vert_rounded,
              color: smjColorsExtension.primary,
            ),
            onSelected: (value) {
              if (value == 1) {
                //onEditTap();
              } else if (value == 2) {}
            },
            popMenuList: _popupMenuList,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Home Interior Design",
                      style: TextStyle(
                          color: color.primary,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    projectStatusChip(
                      data: status[0],
                      onChipClick: () {
                        status.forEach((element) {
                          element.isSelected = false;
                        });
                        status[0].isSelected = true;
                        setState(() {});
                      },
                      // label: status[index].name,
                    )
                  ],
                ),
                Text(
                  "Start Date : 09 jan 2024",
                  style: TextStyle(
                      color: color.lightGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    nameDetailsCard(
                        color: color,
                        label: "Ashween Kumar",
                        content: "+91 98392 83922",
                        isPayment: false),
                    SizedBox(
                      width: 8.w,
                    ),
                    nameDetailsCard(
                        color: color,
                        label: "₹9000",
                        content: "UnPaid",
                        isPayment: true),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Meetings",
                  style: TextStyle(
                    color: color.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => upcomingMeetingCard(color),
                ),
              ],
            ),
          ),
        ));
  }

  Widget nameDetailsCard({
    required SmjColors color,
    required String label,
    required String content,
    required bool isPayment,
  }) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8.r,
          ),
        ),
        border: Border.all(
          color: color.lightGrey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: color.primary,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              content,
              style: TextStyle(
                  color: isPayment ? color.wineRed : color.lightGrey,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget upcomingMeetingCard(SmjColors color) {
    final List<PopupMenuEntry> _popupMenuList = [
      PopupMenuItem(
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
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        padding: EdgeInsets.only(left: 16.w, right: 8.w, bottom: 8.h),
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
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return PrimaryAlertDialog(
                      //       leftBtn: "Cancel",
                      //       rightBtn: "Delete",
                      //       onLeftClick: () => context.pop(),
                      //       title: "Alert!",
                      //       onRightClick: () async {
                      //         onDeleteTap();
                      //         context.pop();
                      //       },
                      //       subTitle: "Are you sure want to delete this vendor?",
                      //     );
                      //   },
                      // );
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
    );
  }
}
