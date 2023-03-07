import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

class FormGroupWithTitle extends StatelessWidget {
  final String title;
  final bool haveDivider;
  final List<Widget> children;

  const FormGroupWithTitle({
    Key? key,
    this.haveDivider = true,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: MainColors.kDefaultText,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: children,
              )
            ],
          ),
        ),
        Container(
          height: haveDivider ? 8 : 0,
          color: MainColors.kDefaultBackground,
        )
      ],
    );
  }
}
