import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/ui/screens/project/add_project_screen.dart';

class RadioButton extends StatefulWidget {
  PaymentStatus? groupValue;
  final PaymentStatus type1;
  final PaymentStatus type2;
  final Function(dynamic value) onChange;

  RadioButton({
    super.key,
    required this.groupValue,
    required this.type1,
    required this.type2,
    required this.onChange,
  });

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () => widget.onChange(widget.type1),
            child: Row(
              children: [
                Radio(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.type1,
                  activeColor: smjColorsExtension.primary,
                  groupValue: widget.groupValue,
                  onChanged: (value) {
                    setState(
                      () {
                        widget.groupValue = value;
                        widget.onChange(value);
                        // print(widget.groupValue);
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 9.w,
                ),
                SizedBox(
                  child: Text(
                    widget.type1.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: widget.type1 == widget.groupValue
                          ? smjColorsExtension.primary
                          : smjColorsExtension.lightGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () => widget.onChange(widget.type2),
            child: Row(
              children: [
                Radio(
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: widget.type2,
                  activeColor: smjColorsExtension.primary,
                  groupValue: widget.groupValue,
                  onChanged: (value) {
                    setState(
                      () {
                        widget.onChange(value);
                        widget.groupValue = value;
                        //print(widget.groupValue);
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 9.w,
                ),
                Text(
                  widget.type2.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: widget.type2 == widget.groupValue
                        ? smjColorsExtension.primary
                        : smjColorsExtension.lightGrey,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum CustomerType { individual, business }

extension CustomerTypeExt on CustomerType {
  String get name {
    switch (this) {
      case CustomerType.individual:
        return 'Individual';
      case CustomerType.business:
        return 'Business';
    }
  }
}
enum InvoiceType { yes, no }

extension InvoiceTypeExt on InvoiceType {
  String get name {
    switch (this) {
      case InvoiceType.yes:
        return 'Yes';
      case InvoiceType.no:
        return 'No';
    }
  }
}
