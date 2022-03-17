import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class EjaraContinueButton extends StatelessWidget {
  const EjaraContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: EjaraStyles.colorWhite,
          backgroundColor: EjaraStyles.colorDarkBlue,
          padding: const EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(
          "Continue",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
