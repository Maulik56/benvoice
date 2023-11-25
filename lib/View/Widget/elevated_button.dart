import 'package:benvoice/Constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double height;
  final double width;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const CommonElevatedButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.height,
      required this.width,
      this.textStyle,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyle = FontTextStyle.w400Style(
      color: Colors.black,
      fontSize: 38.sp,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: backgroundColor,
          gradient: backgroundColor == null
              ? const LinearGradient(
                  begin: Alignment(0.97, -0.23),
                  end: Alignment(-0.97, 0.23),
                  colors: [Color(0xFFD9D9D9), Color(0xFFD9D9D9)],
                )
              : null,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(18),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle ?? defaultTextStyle,
          ),
        ),
      ),
    );
  }
}
