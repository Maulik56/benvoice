import 'package:get/get.dart';

class ApprovedPaymentController extends GetxController {
  Map<int, bool> showInvoice = {};

  void openInvoice(int index) {
    showInvoice[index] = true;
    update();
  }

  void closeInvoice(int index) {
    showInvoice[index] = false;
    update();
  }
}
