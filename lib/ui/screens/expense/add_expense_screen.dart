import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/data/models/expense_model.dart';
import 'package:sjm/data/repositories/expense_repo.dart';
import 'package:sjm/ui/screens/widgets/date_picker.dart';
import 'package:sjm/ui/screens/widgets/primary_button.dart';
import 'package:sjm/ui/screens/widgets/radio_button.dart';
import 'package:sjm/ui/screens/widgets/textfield_with_label.dart';
import 'package:sjm/ui/screens/widgets/textformfield_without_label.dart';

class AddExpenseScreen extends StatefulWidget {
  static AddExpenseScreen builder(BuildContext context, GoRouterState state) =>
      AddExpenseScreen(
        expense: state.extra as Expense?,
      );
  AddExpenseScreen({super.key, this.expense});

  final Expense? expense;

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  Map<String, dynamic> selectedDate = {
    "timeStamp": DateTime.now(),
    'formattedDate': DateFormat('dd-MM-yyyy').format(DateTime.now()),
  };
  final expenseNameController = TextEditingController();
  final ammountController = TextEditingController();
  @override
  void initState() {
    if (widget.expense != null) {
      expenseNameController.text = widget.expense!.title;
      ammountController.text = widget.expense!.amount.toString();
      selectedDate = {
        "timeStamp": widget.expense!.date,
        'formattedDate': DateFormat('dd-MM-yyyy').format(widget.expense!.date),
      };
    }

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final color = smjColorsExtension;
    return Scaffold(
      backgroundColor: color.background,
      appBar: PrimaryAppBar(
        title: "Add Expense",
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
                nameController: expenseNameController,
                label: "Title",
                hintText: "Eg. Scrap book",
              ),
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
                controller: ammountController,
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
                "Date",
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
                "Category",
                style: TextStyle(
                  color: color.primary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  counterText: '',
                  fillColor: color.white.withOpacity(0.6),
                  hintText: "Select Category",
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: color.primary.withOpacity(0.37),
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.5.h,
                  ),
                  errorStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.red,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color.lightGrey.withOpacity(0.3),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color.lightGrey.withOpacity(0.3),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  // focusedErrorBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10.r),
                  //   borderSide: BorderSide(color: widget.colorBorder, width: 2.w),
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color.lightGrey.withOpacity(0.3),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color.lightGrey.withOpacity(0.3),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color.lightGrey.withOpacity(0.3),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      "Category 1",
                      style: TextStyle(
                        color: color.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    value: "Category 1",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Category 2",
                      style: TextStyle(
                        color: color.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    value: "Category 2",
                  ),
                  DropdownMenuItem(
                    child: Text(
                      "Category 3",
                      style: TextStyle(
                        color: color.primary,
                        fontSize: 16.sp,
                      ),
                    ),
                    value: "Category 3",
                  ),
                ],
                onChanged: (p0) {},
              ),
              SizedBox(
                height: 16.h,
              ),
              PrimaryButton(
                text: "Save",
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
                onPressed: () async {
                  if (expenseNameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter the title"),
                      ),
                    );
                    return;
                  }

                  if (ammountController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter the amount"),
                      ),
                    );
                    return;
                  }

                  double ammount = double.parse(ammountController.text);

                  if (widget.expense != null) {
                    Expense expense = Expense(
                      title: expenseNameController.text,
                      amount: ammount,
                      date: selectedDate['timeStamp'],
                      category: "Category 1",
                    );

                    try {
                      await ExpenseRepository()
                          .updateExpense(expense.toMap(), widget.expense!.id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Expense updated successfully"),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Failed to update expense ${e}"),
                        ),
                      );
                    }

                    context.pop(true);

                    return;
                  }

                  Expense expense = Expense(
                    title: expenseNameController.text,
                    amount: ammount,
                    date: selectedDate['timeStamp'],
                    category: "Category 1",
                  );

                  try {
                    await ExpenseRepository().addExpense(expense.toMap());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Expense added successfully"),
                      ),
                    );
                    context.pop();
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Failed to add expense ${e}"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
