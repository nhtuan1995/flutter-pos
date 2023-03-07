// ignore: duplicate_ignore
// ignore_for_file: import_of_legacy_library_into_null_safe, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';

// import 'package:custom_switch/custom_switch.dart';

// ignore: import_of_legacy_library_into_null_safe

class VerticalInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool? isNumber;
  final TextAlign? textAlign;

  const VerticalInput({
    required this.label,
    this.textAlign = TextAlign.left,
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
          label,
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
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.kDefaultInputBorder),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            textAlign: textAlign!,
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
