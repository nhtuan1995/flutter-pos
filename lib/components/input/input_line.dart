import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

class InputLine extends StatelessWidget {
  final String title;
  final Widget? icon;

  const InputLine({
    Key? key,
    this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon ?? const SizedBox(width: 0),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12,
                      color: MainColors.kDefaultText,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            width: 140,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: MainColors.kDefaultInputBorder, width: 1.0)),
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                hintText: "0",
                border: InputBorder.none,
                isDense: true, // tránh nó bị nhảy xuống dòng
              ),
              maxLines: 1,
              style: TextStyle(
                color: MainColors.kDefaultText,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
