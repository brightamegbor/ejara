import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class EjaraBackButton extends StatelessWidget {
  const EjaraBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}
