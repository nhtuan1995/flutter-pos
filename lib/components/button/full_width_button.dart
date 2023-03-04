import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

class FullWidthButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const FullWidthButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MainColors.kDefaultBlue),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(14),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      ),
      onPressed: () => onPressed(),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}
