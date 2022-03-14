import 'package:flutter/widgets.dart';

class PaymentMethodsModel extends ChangeNotifier {
  List _paymentMethods = [];

  List get paymentMethods => _paymentMethods;

  set paymentMethods(List value) {
    _paymentMethods = value;
    notifyListeners();
  }
}
