import 'package:ejara/common/ejara_styles.dart';
import 'package:flutter/material.dart';

class EjaraDropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final void Function(String?) onChanged;

  const EjaraDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
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

        // dropdown_field
        Container(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.5,
              color: EjaraStyles.colorLightBlue.withOpacity(0.5),
            ),
          ),
          child: DropdownButton(
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: EjaraStyles.colorDarkBlue.withOpacity(0.7),
              fontSize: 18.0,
            ),
            underline: const SizedBox.shrink(),
            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: EjaraStyles.colorBlue,
            ),
            items: [
              ...items.map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ),
              ),
            ],
            onChanged: onChanged,
            value: value.isEmpty ? null : value,
          ),
        ),
      ],
    );
  }
}
