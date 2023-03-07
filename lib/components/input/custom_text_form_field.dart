import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final bool required;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.required,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: MainColors.kDefaultInputBorder),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
                text: label,
                style: const TextStyle(color: Colors.grey),
                children: [
                  required
                      ? TextSpan(
                          text: " *",
                          style: TextStyle(
                            color: MainColors.kDanger600,
                          ))
                      : const TextSpan(text: "")
                ]),
          ),
          // border: const OutlineInputBorder(),
          border: InputBorder.none,
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Theme.of(context).colorScheme.error
                  : Colors.orange;
              return TextStyle(color: color, letterSpacing: 1.3);
            },
          ),
        ),
        style: TextStyle(
          color: MainColors.kDefaultText,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.6,
        ),
      ),
    );
  }
}
