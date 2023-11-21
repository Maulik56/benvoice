import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Auth/auth.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BackgroundColorContainer.kRadialGradient(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "בוקר טוב בן!",
              style: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 38.sp,
              ),
            ),
            SizedBox(height: 110.h),
            SmallElevatedButton(
              onPressed: () {
                Get.to(
                  () => const AuthScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              title: "כניסה",
              height: 72.h,
              width: 193.w,
            ),
            SizedBox(height: 110.h),
          ],
        ),
      ),
    );
  }
}
