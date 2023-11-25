import 'package:get/get.dart';

class InvoiceController extends GetxController {
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
