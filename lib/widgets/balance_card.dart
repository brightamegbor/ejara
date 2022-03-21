import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class EjaraBalanceCard extends StatelessWidget {
  const EjaraBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                fontSize: 20.0,
                color: EjaraStyles.colorLightBlue,
                fontWeight: FontWeight.w500,
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
                    fontSize: 32.0,
                    color: EjaraStyles.colorDarkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "CFA",
                  style: TextStyle(
                    fontSize: 32.0,
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
}
