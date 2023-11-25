import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> refuseReasonDialog() {
  return Get.dialog(
    Dialog(
      backgroundColor: Color(0xffD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.sp),
        side: BorderSide(color: Colors.black, width: 1.sp),
      ),
      child: Padding(
        padding: EdgeInsets.all(18.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "סיבת הסירוב",
              style: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 36.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 22.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff989898),
                  border: Border.all(color: Colors.black, width: 1.sp),
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Text(
                  '''
                  מה נראה לך עשו אותי באצבע?
איזה התנהגות זאת גועל נפש כולה בנאדם קנה שפכטל ורובא אתה מחייב אותי כאילו אני בונה בית בדובאי נפלת על הראש תגיד לי? מהר תשלח חשבונית חדשה על הסכום הנכון ותגיד תודה שאני עדיין מוכן לשלם לך
אחרי כזה קטע מסריח
ד”א תמסור ד”ש לאבא לא ראינו אותו אתמול בפוקר ושלומי כפית שואל מה עם מה שהוא הבטיח לו
בקיצור דבר איתי נשמה
                  ''',
                  style: FontTextStyle.w400Style(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            CommonElevatedButton(
              onTap: () => Get.back(),
              title: "שליחה",
              height: 42.h,
              width: 146.w,
              textStyle: FontTextStyle.w400Style(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 300),
    transitionCurve: Curves.easeOut,
  );
}
