import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Auth/welcome.dart';
import 'package:benvoice/View/Home/home_page/home_page.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        clipBehavior: Clip.antiAlias,
        decoration: BackgroundColorContainer.kRadialGradient(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.offAll(
                        () => const WelcomeScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    icon: SvgPicture.asset(ImagePath.backArrow),
                  ),
                ),
                SizedBox(height: 242.h),
                Text(
                  "סיסמא בבקשה:",
                  style: FontTextStyle.w400Style(
                    color: Colors.black,
                    fontSize: 38.sp,
                  ),
                ),
                SizedBox(height: 40.h),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    style: FontTextStyle.w400Style(
                      color: const Color(0xff6B7888),
                      fontSize: 22.sp,
                    ),
                    decoration: InputDecoration(
                      constraints: BoxConstraints.loose(Size(242.w, 40.h)),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Color(0xFF0A0B0D),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          color: Color(0xFF0A0B0D),
                        ),
                      ),
                      fillColor: Colors.white,
                      // Background color
                      filled: true,
                      contentPadding: const EdgeInsets.fromLTRB(12, 4, 3, 4),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                CommonElevatedButton(
                  onTap: () {
                    Get.offAll(
                      () => const Homepage(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                      transition: Transition.fadeIn,
                    );
                  },
                  title: "כניסה",
                  height: 72.h,
                  width: 242.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
