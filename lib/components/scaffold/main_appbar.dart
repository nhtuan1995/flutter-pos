import 'package:flutter/material.dart';

AppBar mainAppBar(
    {Widget? leading,
    Color? backgroundColor = Colors.white,
    Widget? title,
    List<Widget>? actions}) {
  return AppBar(
    leading: leading,
    toolbarHeight: 64.0, // set chiều cao cho cái toolbar nó nằm vào giữa
    backgroundColor: backgroundColor,
    elevation: 0,
    title: title,
    actions: actions,
  );
}
