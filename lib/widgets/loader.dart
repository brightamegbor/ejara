import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class EjaraLoader extends StatelessWidget {
  const EjaraLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: EjaraStyles.colorDarkBlue,
      ),
    );
  }
}
