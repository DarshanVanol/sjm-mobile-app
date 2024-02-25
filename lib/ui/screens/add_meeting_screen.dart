import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/data/models/meeting_model.dart';
import 'package:sjm/data/repositories/meeting_repo.dart';
import 'package:sjm/ui/screens/widgets/primary_button.dart';
import 'package:sjm/ui/screens/widgets/textfield_with_label.dart';
import 'package:sjm/ui/screens/widgets/textformfield_without_label.dart';

class AddMettingScreen extends StatefulWidget {
  static AddMettingScreen builder(BuildContext context, GoRouterState state) =>
      const AddMettingScreen();
  const AddMettingScreen({super.key});

  @override
  State<AddMettingScreen> createState() => _AddMettingScreenState();
}

class _AddMettingScreenState extends State<AddMettingScreen> {
  final projectNameController = TextEditingController();
  final clientNameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return Scaffold(
        backgroundColor: colors.background,
        appBar: PrimaryAppBar(
          title: "Add Meeting",
          leadingBackButton: true,
          onBackPress: () => context.pop(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            children: [
              InputFieldWithLabel(
                nameController: projectNameController,
                label: "Project Name",
                hintText: "Eg. Design Interior",
              ),
              SizedBox(
                height: 16.h,
              ),
              InputFieldWithLabel(
                nameController: clientNameController,
                label: "Client Name",
                hintText: "Eg. Manish Sharma",
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().month + 2),
                        );
                        if (date != null) {
                          dateController.text = date.toIso8601String();
                          selectedDate = date;
                          setState(() {});
                        }
                      },
                      child: InputFieldWithLabel(
                        nameController: dateController,
                        label: "Schedule Date",
                        hintText: "Eg. 01/01/2024",
                      )),
                  SizedBox(
                    width: 16.w,
                  ),
                  InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (time != null) {
                          timeController.text = time.format(context);
                          selectedTime = time;
                          setState(() {});
                        }
                      },
                      child: InputFieldWithLabel(
                        nameController: dateController,
                        label: "Schedule Time",
                        hintText: "Eg. 01:00 PM",
                      )),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              PrimaryButton(
                text: "Add Meeting",
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                onPressed: () async {
                  // validate if all fields are filled
                  if (projectNameController.text.isEmpty ||
                      clientNameController.text.isEmpty ||
                      dateController.text.isEmpty ||
                      timeController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("All fields are required"),
                      ),
                    );
                    return;
                  }

                  // validate if date and time are selected
                  if (selectedDate == null || selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select date and time"),
                      ),
                    );
                    return;
                  }

                  // add meeting to database
                  final meeting = Meeting(
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                    title: projectNameController.text,
                    scheduledOn: DateTime(
                      selectedDate!.year,
                      selectedDate!.month,
                      selectedDate!.day,
                      selectedTime!.hour,
                      selectedTime!.minute,
                    ),
                  );

                  // add meeting to database
                  await MeetingRepository().addMeeting(meeting);

                  context.pop();
                },
              ),
            ],
          ),
        ));
  }
}
