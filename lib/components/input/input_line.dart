import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

class InputLine extends StatelessWidget {
  final String title;

  const InputLine({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14, color: MainColors.kDefaultText, fontWeight: FontWeight.w600),
          ),
          Container(
            width: 140,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: MainColors.kDefaultInputBorder, width: 1.0)),
            child: const TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: "0",
                border: InputBorder.none,
                isDense: true, // tránh nó bị nhảy xuống dòng
              ),
              maxLines: 1,
            ),
          )
        ],
      ),
    );
  }
}
