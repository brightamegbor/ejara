import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class EjaraTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const EjaraTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: EjaraStyles.colorLightBlue.withOpacity(0.5),
              fontSize: 16.0,
            ),
          ),
        ),

        // text field
        TextFormField(
          controller: controller,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: EjaraStyles.colorDarkBlue.withOpacity(0.7),
            fontSize: 18.0,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: 15.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: EjaraStyles.colorLightBlue.withOpacity(0.5),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: EjaraStyles.colorLightBlue.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
