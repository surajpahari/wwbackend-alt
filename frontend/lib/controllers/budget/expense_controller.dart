import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:walletwise/utils/forms/wwForm.dart";

class ExpenseController extends Wwform {
  static ExpenseController get instance => Get.find();
  final item = TextEditingController();
  final amount = TextEditingController();
  final category = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController peroid = TextEditingController(text: "peroid");
  GlobalKey<FormState> expenseFormKey = GlobalKey<FormState>();

  void add() {
    print(date.text.toString());
    print(item.text);
    print(amount.text);
  }

  @override
  void clearFields() {}
}
