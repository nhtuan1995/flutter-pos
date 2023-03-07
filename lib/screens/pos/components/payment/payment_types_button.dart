import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/constants.dart';

class PaymentTypesButton extends StatelessWidget {
  final String iconLink;
  final Color borderColor;
  final Color backgroundColor;
  final String label;
  final Function onSelected;
  final String value;
  final String payTypeState;

  const PaymentTypesButton({
    Key? key,
    required this.iconLink,
    required this.borderColor,
    required this.backgroundColor,
    required this.label,
    required this.onSelected,
    required this.value,
    required this.payTypeState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = payTypeState == value;
    return Flexible(
      flex: 1,
      child: InkWellButton(
        onTap: () => onSelected(value),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isSelected ? backgroundColor : Colors.white,
            border: Border.all(
                color:
                    isSelected ? borderColor : MainColors.kDefaultInputBorder),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(iconLink),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: MainColors.kDefaultText,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
