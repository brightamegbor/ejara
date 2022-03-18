import 'package:ejara/common/ejara_styles.dart';
import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/utils/number_formatter.dart';
import 'package:flutter/material.dart';

class EjaraWalletList extends StatelessWidget {
  final PaymentMethodsModel model;
  const EjaraWalletList({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.wallets.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 5.0,
          ),
          child: GestureDetector(
            onTap: () {
              model.selectedWalletNumber = model.wallets[index].identification;
            },
            child: Card(
              elevation: 10.0,
              shadowColor: EjaraStyles.colorCardShadow.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            EjaraStyles.colorLightBlue.withOpacity(0.2),
                      ),
                      child: Transform.scale(
                        scale: 1.2,
                        child: Radio<String>(
                          value: model.wallets[index].identification,
                          groupValue: model.selectedWalletNumber,
                          onChanged: (String? val) {
                            model.selectedWalletNumber = val!;
                          },
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.wallets[index].titleEn,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: EjaraStyles.colorDarkBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          EjaraNumberFormatter().formatNumber(
                              model.wallets[index].identification),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: EjaraStyles.colorLightBlue.withOpacity(0.5),
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
