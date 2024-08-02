import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/primary_appbar.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/data/models/expense_model.dart';
import 'package:sjm/data/repositories/expense_repo.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/project/project_screen.dart';
import 'package:sjm/ui/screens/widgets/popupmenu_btn.dart';
import 'package:sjm/utils/date_formatter.dart';

class ExpenseDetailsScreen extends StatefulWidget {
  static ExpenseDetailsScreen builder(
          BuildContext context, GoRouterState state) =>
      ExpenseDetailsScreen(
        expense: state.extra as Expense,
      );

  ExpenseDetailsScreen({super.key, required this.expense});
  final Expense expense;
  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
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
          title: "Expense Details",
          leadingBackButton: true,
          onBackPress: () => context.pop(),
          trailingIc: PopupMenuBtn(
            iconData: Icon(
              Icons.more_vert_rounded,
              color: smjColorsExtension.primary,
            ),
            onSelected: (value) async {
              if (value == 1) {
                onEditTap(context, widget.expense);
              } else if (value == 2) {
                if (await onDeleteTap(context, widget.expense.id ?? ""))
                  context.pop();
              }
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
                      widget.expense.title,
                      style: TextStyle(
                          color: color.primary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.expense.category ?? "",
                      style: TextStyle(
                        color: color.lightGrey,
                        fontSize: 16.sp,
                      ),
                    )
                  ],
                ),
                Text(
                  formatDate(widget.expense.date),
                  style: TextStyle(
                      color: color.lightGrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 16.h,
                ),
                nameDetailsCard(
                    color: color,
                    label: "₹${widget.expense.amount}",
                    content: "UnPaid",
                    isPayment: true),
              ],
            ),
          ),
        ));
  }

  Future<bool> onDeleteTap(BuildContext context, String id) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Expense"),
          content: Text("Are you sure you want to delete this expense?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await ExpenseRepository().deleteExpense(id);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Failed to delete expense"),
                    ),
                  );
                }
                context.pop(true);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }

  void onEditTap(BuildContext context, Expense expense) async {
    final result =
        await context.push(SJMRoutes.addExpenseScreen, extra: expense);
    if (result != null && (result as bool)) {
      context.pop();
    }
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
}
