import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool? isSelected;

  const RoundedButton({
    Key? key,
    this.isSelected = true,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            isSelected! ? MainColors.kDefaultBlue : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                  color: isSelected!
                      ? Colors.transparent
                      : MainColors.kDefaultBlue)),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isSelected! ? Colors.white : MainColors.kDefaultBlue),
      ),
    );
  }
}
