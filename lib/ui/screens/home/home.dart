import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/data/models/meeting_model.dart';
import 'package:sjm/data/repositories/meeting_repo.dart';
import 'package:sjm/data/repositories/project_repo.dart';
import 'package:sjm/gen/assets/assets.gen.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/widgets/popupmenu_btn.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final projectStatus = ["In Progress", "In Review", "On Hold", "Completed"];

  final List<Color> widgetColor = [
    smjColorsExtension.lightBlue,
    smjColorsExtension.lightPurple,
    smjColorsExtension.lightOrange,
    smjColorsExtension.green,
  ];

  final ProjectRepository _projectRepository = ProjectRepository();

  @override
  void initState() {
    _projectRepository.initializeCountStream();
    super.initState();
  }

  @override
  void dispose() {
    _projectRepository.disposeCountStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = smjColorsExtension;

    return Scaffold(
        backgroundColor: color.background,
        appBar: PrimaryAppBar(title: "Dashboard", leadingBackButton: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                StreamBuilder(
                  stream: _projectRepository.projectCountsStream,
                  builder: (context, snapshot) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                              projectStatus[index] == 'In Progress'
                                  ? snapshot.hasData
                                      ? snapshot.data!.inProgressCount
                                          .toString()
                                      : "_"
                                  : projectStatus[index] == 'In Review'
                                      ? snapshot.hasData
                                          ? snapshot.data!.inReviewCount
                                              .toString()
                                          : "_"
                                      : projectStatus[index] == 'On Hold'
                                          ? snapshot.hasData
                                              ? snapshot.data!.onHoldCount
                                                  .toString()
                                              : "_"
                                          : snapshot.hasData
                                              ? snapshot.data!.completedCount
                                                  .toString()
                                              : "_",
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
                    InkWell(
                      child: SJMAssets.icons.addIcon.svg(
                        height: 24.w,
                        width: 24.w,
                      ),
                      onTap: () => context.push(SJMRoutes.addMettingScreen),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                StreamBuilder(
                  stream: MeetingRepository().getMeetings(),
                  builder: (context, snapshot) => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.hasData
                        ? snapshot.data?.length
                        : 0, //snapshot.data.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => upcomingMeetingCard(
                        color, snapshot.data![index]), //snapshot.data[index]),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ));
  }

  Widget upcomingMeetingCard(SmjColors color, Meeting meeting) {
    final List<PopupMenuEntry> popupMenuList = [
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
                  meeting.title ?? "Meeting",
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
                  popMenuList: popupMenuList,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Client Name: ${meeting.customerId}" ??
                  "Client Name: Manish Sharma",
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
                  meeting.scheduledOn.toIso8601String(),
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
