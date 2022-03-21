import 'package:ejara/common/ejara_styles.dart';
import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/ui/new_wallet.dart';
import 'package:ejara/utils/payment_methods_api.dart';
import 'package:ejara/widgets/balance_card.dart';
import 'package:ejara/widgets/continue_button.dart';
import 'package:ejara/widgets/error_widget.dart';
import 'package:ejara/widgets/loader.dart';
import 'package:ejara/widgets/moveback_button.dart';
import 'package:ejara/widgets/payment_methods_list.dart';
import 'package:ejara/widgets/text_between_line.dart';
import 'package:ejara/widgets/wallet_list.dart';
import 'package:flutter/material.dart';
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
    return Consumer<PaymentMethodsModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: EjaraStyles.colorBackground,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: const EjaraBackButton(),
                ),

                // choose payment methods
                Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                  child: const Text(
                    "Choose a payment method",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: EjaraStyles.colorDarkerBlue,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // balanceCard
                const EjaraBalanceCard(),

                Container(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  child: const Text(
                    "Select a payment methods",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: EjaraStyles.colorDarkBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // payment_methods
                if (model.paymentMethods.isNotEmpty)
                  EjaraPaymentMethodsList(
                    model: model,
                    onTap: (title) => _showBottomSheet(title),
                  ),

                // error loading payment methods
                if (model.isMethodLoading == false &&
                    model.paymentMethods.isEmpty)
                  const EjaraErrorWidget(),

                // show loading
                if (model.isMethodLoading)
                  const Center(
                    child: EjaraLoader(),
                  ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showBottomSheet(String paymentMethods) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        // <-- for border radius
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (ctx) =>
          Consumer<PaymentMethodsModel>(builder: (context, model, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //header
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Select the " +
                            paymentMethods.toLowerCase() +
                            " method",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: EjaraStyles.colorDarkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //close button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: EjaraStyles.colorDarkBlue,
                      size: 19,
                    ),
                  ),
                ],
              ),
            ),

            // divider
            const Divider(
              thickness: 1.5,
              height: 10.0,
            ),

            // wallets
            if (!model.isWalletLoading)
              model.wallets.isNotEmpty
                  ? Container(
                      constraints: const BoxConstraints(
                        minHeight: 100.0,
                        minWidth: double.infinity,
                        maxHeight: 250.0,
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 30,
                        top: 20,
                      ),
                      child: EjaraWalletList(
                        model: model,
                      ),
                    )
                  // no wallets info
                  : Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "No wallets added",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: EjaraStyles.colorLightBlue.withOpacity(0.5),
                          fontSize: 16.0,
                        ),
                      ),
                    ),

            // set loading
            if (model.isWalletLoading)
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Center(
                  child: EjaraLoader(),
                ),
              ),

            // or
            const TextBetweenLine(text: "Or"),

            // add method
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 30.0,
                bottom: 30.0,
              ),
              child: TextButton(
                // disable click action for bank, no ui provided
                onPressed: paymentMethods.toLowerCase() == "bank"
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewWallet(
                              paymentMethod: paymentMethods.toLowerCase(),
                            ),
                          ),
                        );
                      },
                style: TextButton.styleFrom(
                  primary: EjaraStyles.colorBlue,
                  backgroundColor: EjaraStyles.colorBlue.withOpacity(0.1),
                  padding: const EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Another " + paymentMethods.toLowerCase() + " method",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // continue button
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 30.0,
              ),
              child: const EjaraContinueButton(),
            ),
          ],
        );
      }),
    );
  }
}
