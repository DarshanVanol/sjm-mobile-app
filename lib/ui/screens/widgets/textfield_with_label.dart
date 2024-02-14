
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';
import 'package:sjm/ui/screens/widgets/textformfield_without_label.dart';

class InputFieldWithLabel extends StatelessWidget {

  const InputFieldWithLabel({
    super.key,
    //required this.colors,
    required this.nameController, required this.label, required this.hintText,
  });

  //final SmjColors colors;
  final TextEditingController nameController;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final colors=smjColorsExtension;
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
       label,
        style: TextStyle(
          color: colors.primary,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4.h,),
      //const Space(Dimensions.smallest),
      TextFormFieldWithoutLabel(
        textCapitalization: TextCapitalization.sentences,
        controller: nameController,
        style: TextStyle(
          color: colors.primary,
          fontSize: 16.sp,
        ),
        hintText: hintText,
        isFilled: false,
        isReadOnly: false,
        enableOutlinedBorder: true,
        validator: (p0) {
          
        }, 
        // => required ? Validation.getAddressValidation(p0, context) : null,
      ),
    ],
        );
  }
}