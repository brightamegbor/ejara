import 'package:ejara/models/payment_methods.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Payment state", () {
    test('Payment loading value should be false', () {
      expect(PaymentMethodsModel().isMethodLoading, false);
    });

    test('Payment loading value should be true', () {
      final paymentMethods = PaymentMethodsModel();

      paymentMethods.isMethodLoading = true;

      expect(paymentMethods.isMethodLoading, true);
    });
  });
}
