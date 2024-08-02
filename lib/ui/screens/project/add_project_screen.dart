import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/ui/screens/widgets/date_picker.dart';
import 'package:sjm/ui/screens/widgets/primary_button.dart';
import 'package:sjm/ui/screens/widgets/radio_button.dart';
import 'package:sjm/ui/screens/widgets/textfield_with_label.dart';
import 'package:sjm/ui/screens/widgets/textformfield_without_label.dart';

class AddProjectScreen extends StatefulWidget {
  static AddProjectScreen builder(BuildContext context, GoRouterState state) =>
      AddProjectScreen();
  AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  Map<String, dynamic> selectedDate = {
    "timeStamp": DateTime.now(),
    'formattedDate': DateFormat('dd-MM-yyyy').format(DateTime.now()),
  };
  final projectNameController = TextEditingController();
  PaymentStatus? paymentStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentStatus = PaymentStatus.Paid;
  }

  Widget build(BuildContext context) {
    final color = smjColorsExtension;
    return Scaffold(
      backgroundColor: color.background,
      appBar: PrimaryAppBar(
        title: "Add Project",
        leadingBackButton: true,
        onBackPress: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                nameController: projectNameController,
                label: "Client Name",
                hintText: "Eg. Mukesh Verma",
              ),
              SizedBox(
                height: 16.h,
              ),
              InputFieldWithLabel(
                nameController: projectNameController,
                label: "Mobile Number",
                hintText: "Eg. 90987 89384",
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Start Date",
                style: TextStyle(
                  color: color.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              PrimaryDatePicker(
                initDate: selectedDate,
                date: (p0) {
                  selectedDate = p0;
                  // dueDate = p0;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Due Date",
                style: TextStyle(
                  color: color.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              PrimaryDatePicker(
                  initDate: selectedDate,
                  date: (p0) {
                    selectedDate = p0;
                    // dueDate = p0;
                    setState(() {});
                  }),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Amount",
                style: TextStyle(
                  color: color.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormFieldWithoutLabel(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  )
                ],
                keyboardType: TextInputType.number,
                maxLength: 8,
                suffixIcon: Text(
                  "₹",
                  style: TextStyle(
                    color: color.primary,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                controller: projectNameController,
                style: TextStyle(
                  color: color.primary,
                  fontSize: 16.sp,
                ),
                hintText: "Eg. 300",
                isFilled: false,
                isReadOnly: false,
                enableOutlinedBorder: true,
                validator: (p0) {},
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Payment",
                style: TextStyle(
                  color: color.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              RadioButton(
                groupValue: paymentStatus,
                type1: PaymentStatus.Paid,
                type2: PaymentStatus.UnPaid,
                onChange: (value) {
                  paymentStatus = value;
                  setState(
                    () {
                      // _fistNameController = TextEditingController();
                      // _lastNameController = TextEditingController();
                      // customerType == CustomerType.individual ? _businessNameController.clear() : null;
                    },
                  );

                  //    print(customerType);
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              PrimaryButton(
                text: "Save",
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                onPressed: () async {},
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum PaymentStatus { Paid, UnPaid }
