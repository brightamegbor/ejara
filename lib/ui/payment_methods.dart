import 'package:ejara/common/ejara_styles.dart';
import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/utils/payment_methods_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  void initState() {
    initializes();
    super.initState();
  }

  initializes() async {
    final prefs = await SharedPreferences.getInstance();

    String _token = prefs.getString("token") ?? "";

    if (_token.isEmpty) {
      await PaymentMethodAPI().login();
    }

    PaymentMethodAPI().fetchPaymentMethods(context);
  }

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
                backButton,

                // choose payment methods
                // TODO: remove inkwell
                InkWell(
                  onTap: () {
                    // PaymentMethodAPI().login();
                    // PaymentMethodAPI().fetchPaymentMethods(context);
                    // PaymentMethodAPI().fetchPaymentMethodSettings(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: const Text(
                      "Choose a payment method",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: EjaraStyles.colorDarkerBlue,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // balanceCard
                balanceCard(),

                Container(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
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

                // payment_methods
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 25.0,
                      );
                    },
                    itemCount: model.paymentMethods.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          PaymentMethodAPI().fetchPaymentMethodSettings(
                            context,
                            model.paymentMethods[index].code,
                          );
                        },
                        child: Row(
                          children: [
                            // icon
                            Container(
                                padding: const EdgeInsets.all(12.0),
                                margin: const EdgeInsets.only(right: 15.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: EjaraStyles.colorBlue.withOpacity(0.1),
                                ),
                                child: Icon(
                                  getIcon(model.paymentMethods[index].titleEn),
                                  color: EjaraStyles.colorBlue,
                                )),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.paymentMethods[index].titleEn,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: EjaraStyles.colorDarkBlue
                                        .withOpacity(0.7),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  child: const Text(
                                    "Fees: ",
                                    style: TextStyle(
                                      color: EjaraStyles.colorLightBlue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
                fontWeight: FontWeight.w600,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "CFA",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: EjaraStyles.colorLightBlue,
                    fontWeight: FontWeight.w500,
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
                children: [
                  Text(
                    "Earnings per day",
                    style: TextStyle(
                      color: EjaraStyles.colorLightBlue.withOpacity(0.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "10,000CFA",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: EjaraStyles.colorLightBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  IconData getIcon(String name) {
    IconData icon;
    switch (name.toLowerCase()) {
      case "mobile money":
        icon = Icons.phone_android_rounded;
        break;
      case "bank":
        icon = FontAwesome.bank;
        break;
      default:
        icon = Icons.attach_money;
    }

    return icon;
  }
}
