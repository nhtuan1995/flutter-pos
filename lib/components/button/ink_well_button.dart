import 'package:flutter/material.dart';

class InkWellButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final Color? color;

  const InkWellButton({
    super.key,
    this.color = Colors.transparent,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: () => onTap(),
        child: child,
      ),
    );
  }
}
