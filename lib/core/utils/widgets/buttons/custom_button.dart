import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles/colors/app_color.dart';
import '../../../styles/fonts/my_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.txt,
    this.height,
    this.width,
    this.color,
    this.textColor,
    required this.onPressed,
  });

  final String txt;
  final double? height;
  final double? width;
  final Color? color , textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll<double>(0),
          backgroundColor:
              WidgetStatePropertyAll<Color>(color ?? AppColor.yellow),
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: width ?? 0, vertical: 12.h)),
          shape: WidgetStatePropertyAll<OutlinedBorder>(RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color:color ?? AppColor.yellow))
          )),
      child: Center(
        child: Text(
          txt,
          style: AppFonts.styleMedium_18
        ),
      ),
    );
  }
}
