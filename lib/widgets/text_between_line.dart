import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class TextBetweenLine extends StatelessWidget {
  final String text;
  const TextBetweenLine({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: EjaraStyles.colorLightBlue.withOpacity(0.1),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: EjaraStyles.colorLightBlue.withOpacity(0.5),
                fontSize: 16.0,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              color: EjaraStyles.colorLightBlue.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
