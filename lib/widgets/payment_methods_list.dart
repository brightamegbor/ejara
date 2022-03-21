import 'package:ejara/common/ejara_styles.dart';
import 'package:ejara/models/payment_methods.dart';
import 'package:ejara/utils/icon_selector.dart';
import 'package:ejara/utils/payment_methods_api.dart';
import 'package:flutter/material.dart';

class EjaraPaymentMethodsList extends StatelessWidget {
  final PaymentMethodsModel model;
  final Function(String) onTap;

  const EjaraPaymentMethodsList(
      {Key? key, required this.model, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          height: 35.0,
        );
      },
      //prevents scroll
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.paymentMethods.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (model.selectedMethod !=
                model.paymentMethods[index].id.toString()) {
              model.selectedMethod = model.paymentMethods[index].id.toString();
              model.wallets = [];

              PaymentMethodAPI().fetchPaymentMethodSettings(
                context,
                model.paymentMethods[index].id.toString(),
              );
            }

            onTap(model.paymentMethods[index].titleEn);
          },
          child: Row(
            children: [
              // icon
              Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: EjaraStyles.colorLightBlue.withOpacity(0.1),
                  ),
                  child: Icon(
                    IconSelector().getIcon(model.paymentMethods[index].titleEn),
                    color: EjaraStyles.colorBlue,
                  )),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.paymentMethods[index].titleEn,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: EjaraStyles.colorDarkBlue.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                    ),
                    child: Text(
                      "Fees: " + model.paymentMethods[index].fees,
                      style: TextStyle(
                        color: EjaraStyles.colorLightBlue.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
