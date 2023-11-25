import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/Controller/invoice_controller.dart';
import 'package:benvoice/View/Home/MakePayment/new_payment_screen.dart';
import 'package:benvoice/View/Home/PendingPayment/PendingPaymentTab/payment_approval_dialog.dart';
import 'package:benvoice/View/Home/PendingPayment/PendingPaymentTab/refuse_reason_dialog.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PendingPaymentsTab extends StatefulWidget {
  const PendingPaymentsTab({super.key});

  @override
  State<PendingPaymentsTab> createState() => _PendingPaymentsTabState();
}

class _PendingPaymentsTabState extends State<PendingPaymentsTab> {
  InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 15.h),
                decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black, width: 1.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Column(
                              children: [
                                CommonElevatedButton(
                                  onTap: () {
                                    paymentApprovalDialog();
                                  },
                                  title: "אישור",
                                  backgroundColor: const Color(0xFF4F9F4E),
                                  textStyle: FontTextStyle.w400Style(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  height: 44.h,
                                  width: 67.w,
                                ),
                                SizedBox(height: 15.h),
                                CommonElevatedButton(
                                  onTap: () {
                                    refuseReasonDialog();
                                  },
                                  backgroundColor: const Color(0xff9B2A90),
                                  title: "סירוב",
                                  textStyle: FontTextStyle.w400Style(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  height: 44.h,
                                  width: 67.w,
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<InvoiceController>(
                            builder: (controller) {
                              return controller.showInvoice[index] ?? false
                                  ? const SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        invoiceController.openInvoice(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xff989898),
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(18.sp)),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_downward,
                                                size: 15.sp,
                                              ),
                                              SizedBox(width: 10.w),
                                              Text(
                                                "הצגת חשבונית",
                                                style: FontTextStyle.w400Style(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          ),
                          Column(
                            children: [
                              Text(
                                "יעקב חומרי בניין",
                                style: FontTextStyle.w700Style(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.h),
                                child: Text(
                                  "₪3853",
                                  style: FontTextStyle.w400Style(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              Text(
                                "ציוד משרדי",
                                style: FontTextStyle.w400Style(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          ),
                        ],
                      ),
                      GetBuilder<InvoiceController>(
                        builder: (controller) {
                          return controller.showInvoice[index] ?? false
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(18.sp)),
                                    color: const Color(0xff989898),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w),
                                        child: Container(
                                          // width: 313.w,
                                          height: 228.h,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffE6E6E6),
                                            borderRadius: BorderRadius.circular(18.sp),
                                            border: Border.all(color: Colors.black, width: 1.sp),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            invoiceController.closeInvoice(index);
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.arrow_upward,
                                                size: 15.sp,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 10.w),
                                              Text(
                                                "הצגת חשבונית",
                                                style: FontTextStyle.w400Style(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          width: Get.width,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(99, 99, 99, 0.29),
            border: Border(
              top: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                CommonElevatedButton(
                  onTap: () {},
                  title: "סריקת חשבונית",
                  textStyle: FontTextStyle.w400Style(
                    color: Colors.black,
                    fontSize: 38.sp,
                  ),
                  height: 72.h,
                  width: 285.w,
                ),
                SizedBox(height: 26.h),
                CommonElevatedButton(
                  onTap: () {
                    Get.to(() => const NewPaymentScreen());
                  },
                  title: "תשלום חדש",
                  textStyle: FontTextStyle.w400Style(
                    color: Colors.black,
                    fontSize: 38.sp,
                  ),
                  height: 72.h,
                  width: 285.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
