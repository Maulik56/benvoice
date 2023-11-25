import 'package:benvoice/Constant/colors.dart';
import 'package:benvoice/Constant/decoration.dart';
import 'package:benvoice/Constant/image_path.dart';
import 'package:benvoice/Constant/text_style.dart';
import 'package:benvoice/View/Home/MakePayment/payment_received_receipt.dart';
import 'package:benvoice/View/Widget/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({super.key});

  @override
  State<CreditCardPaymentScreen> createState() => _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController cvvCodeController = TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cardHolderNameController.dispose();
    cvvCodeController.dispose();
    super.dispose();
  }

  TextStyle similarTextStyle = FontTextStyle.w400Style(color: Colors.black, fontSize: 15.sp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        clipBehavior: Clip.antiAlias,
        decoration: BackgroundColorContainer.kLinearGradient(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImagePath.paymentHeader,
                  height: 100.sp,
                  width: 100.sp,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20.h),
                Text(
                  "תשלום בכרטיס",
                  style: FontTextStyle.w700Style(
                    color: PickColor.paymentBlue,
                    fontSize: 38.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                CreditCardForm(
                  cardNumber: cardNumberController.text,
                  expiryDate: expiryDateController.text,
                  cardHolderName: cardHolderNameController.text,
                  cvvCode: cvvCodeController.text,
                  onCreditCardModelChange: (CreditCardModel data) {},
                  formKey: formKey,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                      border: OutlineInputBorder(),
                    ),
                    expiryDateDecoration: InputDecoration(
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                      border: OutlineInputBorder(),
                    ),
                    cvvCodeDecoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                      border: OutlineInputBorder(),
                    ),
                    cardHolderDecoration: InputDecoration(
                      labelText: 'Card Holder',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  obscureCvv: true,
                  obscureNumber: true,
                ),
                SizedBox(height: 20.h),
                CommonElevatedButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Get.off(() => const PaymentReceivedReceiptScreen());
                    }
                  },
                  title: "קבל תשלום",
                  textStyle: FontTextStyle.w400Style(
                    color: Colors.white,
                    fontSize: 24.sp,
                  ),
                  backgroundColor: PickColor.paymentBlue,
                  height: 60.h,
                  width: 220.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
