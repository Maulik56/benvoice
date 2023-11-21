import 'package:benvoice/Constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color titleColor;

  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9.h),
      child: Container(
        width: 315.w,
        height: 72.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            onPrimary: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            padding: EdgeInsets.zero,
            fixedSize: Size(315.w, 72.h),
          ),
          child: Text(
            title,
            style: FontTextStyle.w400Style(
              color: titleColor,
              fontSize: 38.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
  final double width;

  const SmallElevatedButton(
      {super.key, required this.onPressed, required this.title, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff000000)),
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            begin: Alignment(-1.249, -1.153),
            end: Alignment(1.073, 2.806),
            colors: <Color>[Color(0xffd9d9d9), Color(0xffd9d9d9)],
            stops: <double>[0.138, 1],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: FontTextStyle.w400Style(
              color: Colors.black,
              fontSize: 38.sp,
            ),
          ),
        ),
      ),
    );
  }
}
