import 'package:ejara/common/ejara_styles.dart';
import 'package:ejara/utils/text_field_number_format.dart';
import 'package:ejara/widgets/continue_button.dart';
import 'package:ejara/widgets/dropdown_field.dart';
import 'package:ejara/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NewWallet extends StatefulWidget {
  final String paymentMethod;

  const NewWallet({Key? key, required this.paymentMethod}) : super(key: key);

  @override
  State<NewWallet> createState() => _NewWalletState();
}

class _NewWalletState extends State<NewWallet> {
  String operatorSelected = "";

  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool saveAs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EjaraStyles.colorWhite,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // close button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: closeButton(context),
                      ),

                      // new mobile
                      Center(
                        child: Container(
                          padding:
                              const EdgeInsets.only(top: 25.0, bottom: 15.0),
                          child: Text(
                            "New " + widget.paymentMethod,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: EjaraStyles.colorDarkerBlue,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // dropdownButton
                      EjaraDropdownField(
                        label: "Choose the mobile operator",
                        items: const ["Orange Money", "MTN Mobile Money"],
                        value: operatorSelected,
                        onChanged: onChanged,
                      ),

                      const SizedBox(height: 25),

                      // phone text field
                      EjaraTextField(
                        label: "Phone number",
                        controller: phoneController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          EjaraCustomInputFormatter()
                        ],
                        maxLength: 13,
                      ),

                      const SizedBox(height: 25),

                      // name text field
                      EjaraTextField(
                        label: "Full name",
                        controller: nameController,
                      ),

                      const SizedBox(height: 25),

                      // save paymentMethod
                      Row(
                        children: [
                          // switch
                          FlutterSwitch(
                            width: 28.0,
                            height: 18.0,
                            valueFontSize: 10.0,
                            toggleSize: 10.0,
                            value: saveAs,
                            activeColor: EjaraStyles.colorBlue,
                            onToggle: (val) {
                              setState(() {
                                saveAs = val;
                              });
                            },
                          ),

                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Save as payment method",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: EjaraStyles.colorDarkBlue.withOpacity(0.5),
                              fontSize: 18.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // continue button
              Container(
                  margin: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: const EjaraContinueButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget closeButton(context) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: EjaraStyles.colorLightBlue.withOpacity(0.1),
        ),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close,
            color: EjaraStyles.colorBlue,
            size: 18.0,
          ),
        ),
      );

  void onChanged(String? val) {
    setState(() {
      operatorSelected = val!;
    });
  }
}
