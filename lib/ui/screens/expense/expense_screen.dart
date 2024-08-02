import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/data/repositories/expense_repo.dart';
import 'package:sjm/router/routes_names.dart';
import 'package:sjm/ui/screens/widgets/main_appbar.dart';
import 'package:sjm/ui/screens/widgets/search_app_bar.dart';
import 'package:sjm/utils/date_formatter.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return Scaffold(
        backgroundColor: colors.background,
        appBar: MainAppBar(
          title: "Expenses",
          secLastIc: InkWell(
            onTap: () {
              null;
            },
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
          onTapRight: () => context.push(SJMRoutes.addExpenseScreen),
        ),
        body: StreamBuilder(
          stream: ExpenseRepository().getExpensesStream(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.hasError
                  ? Center(
                      child: Text("Error: ${snapshot.error}"),
                    )
                  : snapshot.hasData
                      ? snapshot.data?.length == 0
                          ? Center(
                              child: Text("No Expenses"),
                            )
                          : ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return ExpenseTile(
                                  colors: colors,
                                  amount: snapshot.data![index].amount,
                                  category:
                                      snapshot.data![index].category ?? "",
                                  date: formatDate(snapshot.data![index].date),
                                  onTap: () => context.push(
                                      SJMRoutes.expenseDetailScreen,
                                      extra: snapshot.data![index]),
                                  title: snapshot.data![index].title ?? "",
                                );
                              },
                            )
                      : Center(
                          child: Text("No Expenses"),
                        ),
        ));
  }
}

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
    required this.colors,
    required this.onTap,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
  });

  final SmjColors colors;
  final void Function()? onTap;
  final String title;
  final String category;
  final String date;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10.r,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "₹${amount}",
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 13.sp,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
