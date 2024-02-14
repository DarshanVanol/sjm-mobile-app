import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sjm/common/theme/theme.dart';

class TextFormFieldWithoutLabel extends StatefulWidget {
  TextFormFieldWithoutLabel({
    Key? key,
    required this.controller,
    this.autovalidateMode,
    this.backgroundColor,
    this.hintText,
    this.suffixIcon,
    this.iconPaddingSize,
    this.isObsecure,
    this.isReadOnly,
    this.onTap,
    this.onChanged,
    this.validator,
    this.enableOutlinedBorder = false,
    this.isFilled = true,
    this.prefixIcon,
    this.style,
    this.hintStyle,
    this.borderRadius,
    this.contentPadding,
    this.maxLength,
    this.multiLines,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.inputFormatters,
    this.fieldKey,
  }) : super(key: key);
  final TextEditingController controller;
  final Color? backgroundColor;
  final String? hintText;
  void Function(String)? onChanged;
  final Widget? suffixIcon;
  final double? iconPaddingSize;
  final bool? isObsecure;
  final bool? isReadOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final bool enableOutlinedBorder;
  final bool isFilled;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final int? multiLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final GlobalKey<FormFieldState>? fieldKey;
  final AutovalidateMode? autovalidateMode;

  @override
  State<TextFormFieldWithoutLabel> createState() => _TextFormFieldWithoutLabelState();
}

class _TextFormFieldWithoutLabelState extends State<TextFormFieldWithoutLabel> {
  bool obSecureText = false;

  @override
  void initState() {
    obSecureText = widget.isObsecure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = smjColorsExtension;
    return TextFormField(
      //cursorHeight: 16.h,

      key: widget.fieldKey,
      onChanged:  widget.onChanged,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      maxLines: widget.multiLines ?? 1,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization != null ? widget.textCapitalization! : TextCapitalization.none,
      obscureText: obSecureText,
      readOnly: widget.isReadOnly ?? false,
      style: widget.style ??
          TextStyle(
            fontSize: widget.multiLines == null ? 16.sp : 14.sp,
            color: colors.lightGrey,
            fontWeight: FontWeight.w600,
          ),
      onTap: widget.onTap,
      decoration: InputDecoration(
        counterText: '',
        filled: widget.isFilled,
        fillColor: widget.backgroundColor ?? colors.white.withOpacity(0.6),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
              fontSize: widget.multiLines == null ? 14.sp : 14.sp,
              color: colors.primary.withOpacity(0.37),
              fontWeight: FontWeight.w300,
            ),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 16.5.h,
            ),
        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                  horizontal: widget.iconPaddingSize ?? 12.w,
                ),
                onPressed: widget.isObsecure ?? false
                    ? () {
                        setState(() {
                          obSecureText = !obSecureText;
                        });
                      }
                    : null,
                icon: widget.suffixIcon!,
              )
            : null,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.enableOutlinedBorder ? colors.lightGrey.withOpacity(0.3) : Colors.transparent,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.enableOutlinedBorder ? colors.lightGrey.withOpacity(0.3) : Colors.transparent,
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
            color: widget.enableOutlinedBorder ? colors.lightGrey.withOpacity(0.3) : Colors.transparent,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.enableOutlinedBorder ? colors.lightGrey.withOpacity(0.3) : Colors.transparent,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.enableOutlinedBorder ? colors.lightGrey.withOpacity(0.3) : Colors.transparent,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  outlineInputBorder(Color colors) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r
       // widget.multiLines == null ? Dimensions.of(context).radii.smallest + 6.w : Dimensions.of(context).radii.smallest,
      ),
      borderSide: BorderSide(
        width: 1.w,
        color: colors,
      ),
    );
  }
}
