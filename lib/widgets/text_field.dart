import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EjaraTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const EjaraTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.inputFormatters,
    this.maxLength,
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
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: EjaraStyles.colorDarkBlue.withOpacity(0.7),
            fontSize: 18.0,
          ),
          decoration: InputDecoration(
            counterText: "",
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
