
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sjm/common/theme/theme.dart';

class PrimaryDatePicker extends StatefulWidget {
  final void Function(Map<String, dynamic>) date;
  Map<String, dynamic>? initDate;
  Map<String, dynamic>? startDate;
  Map<String, dynamic>? selectedDate;
  bool? dueDate;

  PrimaryDatePicker({
    Key? key,
    this.dueDate,
    this.startDate,
    this.selectedDate,
    required this.initDate,
    required this.date,
  }) : super(key: key);

  @override
  State<PrimaryDatePicker> createState() => _PrimaryDatePickerState();
}

class _PrimaryDatePickerState extends State<PrimaryDatePicker> {
  //String selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  //Map<String, dynamic>? selectedDate;

  // "timeStamp": DateTime.now(),
  // 'formattedDate': DateFormat('dd-MM-yyyy').format(DateTime.now()),

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return InkWell(
      onTap: () async {
        widget.selectedDate = await _selectDate(
          context: context,
          startDate: widget.startDate?['timeStamp'],
          initialDate: widget.initDate?['timeStamp'],
          isDueDate: widget.dueDate ?? false,
        );
        widget.date(widget.selectedDate!);
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: colors.lightGrey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedDate != null
                  ? DateFormat('dd-MM-yyyy').format(widget.selectedDate?["timeStamp"])
                  : DateFormat('dd-MM-yyyy').format(widget.initDate?["timeStamp"]),
              style: TextStyle(
                color: colors.lightGrey,
                fontSize: 14.sp,
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              color: colors.primary,
            )
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _selectDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? startDate,
    required bool isDueDate,
  }) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: isDueDate ? startDate ?? DateTime.now() : DateTime(2023),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (pickedDate != null) {
      //print("${pickedDate}");
      // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      final Map<String, dynamic> dateData = {};

      // print(formattedDate); //formatted date output using intl package =>  2021-03-16
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateData.addAll({
        "timeStamp": pickedDate,
        'formattedDate': formattedDate,
      });
      return dateData;
    } else {
      return null;
    }
  }
}
