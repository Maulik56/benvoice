import 'package:benvoice/Constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final double width;
  final double height;

  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: FontTextStyle.w400Style(
              color: Colors.black,
              fontSize: 18.sp,
            ),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF989898),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.black, width: 1.sp),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 20.sp,
              ),
              contentPadding: EdgeInsets.all(10.sp),
            ),
            textAlign: TextAlign.right,
            style: FontTextStyle.w400Style(
              color: Colors.black,
              fontSize: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
