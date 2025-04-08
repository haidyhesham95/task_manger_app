import 'package:flutter/material.dart';
import '../../styles/colors/app_color.dart';
import '../../styles/fonts/my_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintTxt,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.isPassword,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.prefixIconColor,
      this.maxLines,
      this.keyboardType});

  final String hintTxt;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon, prefixIcon;
  final bool? isPassword;
  final void Function(String)? onFieldSubmitted;
  final Color? prefixIconColor;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isPassword ?? false,
        cursorColor: AppColor.darkGray,
        style: AppFonts.styleRegular_16.copyWith(color: AppColor.lightGray),
        validator: validator,
        controller: controller,
        textAlign: TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.black,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor ?? AppColor.gray,
          hintStyle:
              AppFonts.styleRegular_16.copyWith(color: AppColor.darkGray),
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.gray), //borderGray
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.gray), //borderGray
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.gray), //borderGray
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.gray), //borderGray
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.gray), //borderGray
          ), //borderGray
        ),
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
