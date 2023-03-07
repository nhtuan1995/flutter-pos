// ignore: duplicate_ignore
// ignore_for_file: import_of_legacy_library_into_null_safe, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';

// import 'package:custom_switch/custom_switch.dart';

// ignore: import_of_legacy_library_into_null_safe

class PaymentVerticalInput extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool? isNumber;
  final TextAlign? textAlign;

  const PaymentVerticalInput({
    required this.label,
    this.textAlign = TextAlign.right,
    this.hintText,
    this.isNumber = false,
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentVerticalInput> createState() => _PaymentVerticalInputState();
}

class _PaymentVerticalInputState extends State<PaymentVerticalInput> {
  bool isDebt = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                color: MainColors.kDefaultText,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.kDefaultInputBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            textAlign: widget.textAlign!,
            keyboardType:
                widget.isNumber! ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
            ),
            style: TextStyle(
              color: MainColors.kDefaultBlue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 16, top : 8),
          width: double.infinity,
          child: Text(
            "Ghi nợ : 15,000",
            style: TextStyle(
              color: MainColors.kDanger600,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
