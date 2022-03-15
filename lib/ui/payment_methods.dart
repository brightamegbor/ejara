import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: EjaraStyles.colorBackground,
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton,

              // choose payment methods
              Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: const Text(
                  "Choose a payment method",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: EjaraStyles.colorDarkerBlue,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // balanceCard
              balanceCard(),

              Container(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                ),
                child: const Text(
                  "Select a payment methods",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: EjaraStyles.colorDarkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Container backButton = Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: EjaraStyles.colorLightBlue.withOpacity(0.1),
    ),
    child: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: EjaraStyles.colorBlue,
        size: 18.0,
      ),
    ),
  );

  Card balanceCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
      shadowColor: EjaraStyles.colorCardShadow.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),

          // icon
          Card(
            elevation: 10.0,
            shadowColor: EjaraStyles.colorBlue.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: EjaraStyles.colorBlue.withOpacity(0.5),
            child: Container(
              padding: const EdgeInsets.all(18.0),
              child: const Icon(
                Icons.folder_outlined,
                size: 24.0,
                color: EjaraStyles.colorWhite,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 15.0),
            child: const Text(
              "Ejara Flex",
              style: TextStyle(
                fontSize: 22.0,
                color: EjaraStyles.colorLightBlue,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "20,000",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: EjaraStyles.colorDarkBlue,
                  ),
                ),
                Text(
                  "CFA",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: EjaraStyles.colorLightBlue,
                  ),
                ),
              ],
            ),
          ),

          Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: const Divider()),

          Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Earnings per day",
                    style: TextStyle(
                      color: EjaraStyles.colorLightBlue,
                    ),
                  ),
                  Text(
                    "10,000CFA",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: EjaraStyles.colorLightBlue,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
