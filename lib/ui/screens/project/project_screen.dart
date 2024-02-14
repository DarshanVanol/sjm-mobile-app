import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/add_meeting_screen.dart';
import 'package:sjm/ui/screens/widgets/main_appbar.dart';
import 'package:sjm/ui/screens/widgets/project_card.dart';

class ProjectScreen extends StatefulWidget {
  ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<StatusModel> status = [
    StatusModel(
      name: "In Progress",
      color: smjColorsExtension.lightBlue,
      isSelected: true,
    ),
    StatusModel(
      name: "In Review",
      color: smjColorsExtension.lightPurple,
      isSelected: false,
    ),
    StatusModel(
      name: "On Hold",
      color: smjColorsExtension.lightOrange,
      isSelected: false,
    ),
    StatusModel(
      name: "Completed",
      color: smjColorsExtension.green,
      isSelected: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: MainAppBar(
        title: "Projects",
        secLastIc: InkWell(
          onTap: () {},
          child: SizedBox(
            width: 30.w,
            height: 30.h,
            child: Icon(
              Icons.search,
              color: colors.primary,
              size: 26.sp,
            ),
          ),
        ),
        onTapRight: () => context.push(SJMRoutes.addMettingScreen),
      ),
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
              height: 40.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: status.length,
                itemBuilder: (context, index) {
                  return projectStatusChip(
                    data: status[index],
                    onChipClick: () {
                      status.forEach((element) {element.isSelected=false;});
                      status[index].isSelected=true;
                      setState(() {
                        
                      });
                    },
                    // label: status[index].name,
                  );
                },
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 58.h, bottom: 0.h),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProjectCard(),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

class projectStatusChip extends StatelessWidget {
  const projectStatusChip({
    super.key,
    // required this.label,
    required this.data, required this.onChipClick,
  });
  final StatusModel data;
  final void Function() onChipClick;

  // final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onChipClick,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        // height: 50.h,
        decoration: BoxDecoration(
          color: data.isSelected ? data.color : smjColorsExtension.background,
          border: Border.all(color: smjColorsExtension.primary),
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        child: Text(
          data.name,
          style: TextStyle(
            color: smjColorsExtension.primary,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

class StatusModel {
  final String name;
  final Color color;
  bool isSelected;

  StatusModel(
      {required this.name, required this.color, required this.isSelected});
}
