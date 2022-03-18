import 'package:ejara/utils/payment_methods_api.dart';
import 'package:flutter/material.dart';

class EjaraErrorWidget extends StatelessWidget {
  const EjaraErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: [
            const Text("Error loading payment methods"),
            OutlinedButton(
              onPressed: () async {
                await PaymentMethodAPI().login();
                PaymentMethodAPI().fetchPaymentMethods(context);
              },
              child: const Text("Reload"),
            ),
          ],
        ),
      ),
    );
  }
}
