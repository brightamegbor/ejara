import 'package:ejara/common/ejara_styles.dart';
import 'package:ejara/models/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewWallet extends StatelessWidget {
  final String paymentMethod;
  const NewWallet({Key? key, required this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<PaymentMethodsModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: EjaraStyles.colorBackground,
          body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                closeButton(context),

                // choose payment methods
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                    child: Text(
                      "New " + paymentMethod,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: EjaraStyles.colorDarkerBlue,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget closeButton(context) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: EjaraStyles.colorLightBlue.withOpacity(0.1),
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            color: EjaraStyles.colorBlue,
            size: 18.0,
          ),
        ),
      );
}
