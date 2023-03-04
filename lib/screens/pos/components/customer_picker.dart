// ignore: duplicate_ignore
// ignore_for_file: import_of_legacy_library_into_null_safe, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/action_sheet/main_action_sheets.dart';

import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/constants.dart';

// import 'package:custom_switch/custom_switch.dart';

// ignore: import_of_legacy_library_into_null_safe

class CustomerPicker extends StatefulWidget {
  const CustomerPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerPicker> createState() => _CustomerPickerState();
}

class _CustomerPickerState extends State<CustomerPicker> {
  bool isShip = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 12,
        ),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWellButton(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/user.svg"),
                  const SizedBox(width: 8),
                  Text(
                    "Chọn khách hàng",
                    style: TextStyle(
                      color: MainColors.kDefaultLink,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Giao hàng",
                  style: TextStyle(
                    color: MainColors.kDefaultText,
                  ),
                ),
                Switch(
                    value: isShip,
                    onChanged: (bool value) {
                      if (value) {
                        showModalBottomSheet<dynamic>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: ((context) {
                            return MainActionSheet(
                              title: "Thông tin giao hàng",
                              body: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                child: Column(
                                  children: const [
                                    VerticalInput(
                                      label: "Địa chỉ giao hàng",
                                      hintText: "Vui lòng nhập địa chỉ",
                                    ),
                                    SizedBox(height: 16,),
                                    VerticalInput(
                                      label: "Phí giao hàng",
                                      hintText: "Phí trả đối tác",
                                      isNumber: true,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      }
                      setState(() {
                        isShip = value;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VerticalInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool? isNumber; 

  const VerticalInput({
    required this.label,
    this.hintText,
    this.isNumber = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Địa chỉ giao hàng",
          style: TextStyle(
            color: MainColors.kDefaultText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.kDefaultInputBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            keyboardType: isNumber! ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        )
      ],
    );
  }
}
