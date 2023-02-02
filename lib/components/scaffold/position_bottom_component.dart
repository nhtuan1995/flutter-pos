import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/screen_size.dart';

class PositionedBottom extends StatelessWidget {
  final List<Widget> children;
  const PositionedBottom({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
          width: screenSize(context).width,
          color: MainColors.kDefaultBackground,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          )),
    );
  }
}
