import 'package:benvoice/Constant/font_family.dart';
import 'package:benvoice/View/Auth/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      ensureScreenSize: true,
      designSize: const Size(360, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: FontFamily.alef,
          ),
          home: const Scaffold(
            body: WelcomeScreen(),
          ),
        );
      },
    );
  }
}
