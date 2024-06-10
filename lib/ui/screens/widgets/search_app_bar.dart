import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';

class SearchAppBar extends AppBar {
  SearchAppBar(
      {super.key,
      required BuildContext context,
      required TextEditingController controller,
      required void Function() onTrailIcTap,
      required bool isSearch,

      required void Function()? onEditingComplete})
      : super(
          backgroundColor: smjColorsExtension.background,
          scrolledUnderElevation: 0,
          leadingWidth: 14.w,
          title: TextFormField(
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.words,
            controller: controller,

            onEditingComplete: onEditingComplete,
            autofocus: true,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: smjColorsExtension.lightGrey,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: smjColorsExtension.lightGrey,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: smjColorsExtension.lightGrey,
                ),
              ),
              hintText: "Search here",
            ),
            onFieldSubmitted: (value) => print("submittttt"),
          ),
          leading: SizedBox(
            width: 4.w,
          ),
          centerTitle: false,
          actions: [
            InkWell(
              onTap: onTrailIcTap,
              child: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: isSearch
                    ? const Icon(
                        Icons.close,
                      )
                    : const Icon(Icons.search),
              ),
            ),
          ],
        ); //   @override
  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
// class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final TextEditingController controller;
//   final void Function() onTrailIcTap;
//   final bool isSearch;
//   final void Function(String) onChange;
//
//   const SearchAppBar({
//     Key? key,
//     required this.controller,
//     required this.onTrailIcTap,
//     required this.isSearch,
//     required this.onChange,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final colors = kaanaAppColorsExtension;
//     return AppBar(
//       backgroundColor: colors.background,
//       scrolledUnderElevation: 0,
//       leadingWidth: 14.w,
//       title: TextFormField(
//         controller: controller,
//         onChanged: onChange,
//         decoration: InputDecoration(
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: colors.lightGrey,
//             ),
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: colors.lightGrey,
//             ),
//           ),
//           border: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: colors.lightGrey,
//             ),
//           ),
//           hintText: "Search here",
//         ),
//       ),
//       leading: SizedBox(
//         width: 4.w,
//       ),
//       centerTitle: false,
//       actions: [
//         InkWell(
//           onTap: onTrailIcTap,
//           child: Padding(
//             padding: EdgeInsets.only(right: 24.w),
//             child: isSearch
//                 ? const Icon(
//                     Icons.close,
//                   )
//                 : const Icon(Icons.search),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(60.h);
// }
