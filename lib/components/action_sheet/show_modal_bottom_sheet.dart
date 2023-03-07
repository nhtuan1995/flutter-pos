import 'package:flutter/material.dart';

class ModalBottomSheet {
  // ignore: unused_element
  static void _openModalBottomSheet(context, Widget child) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: ((context) {
        return child;
      }),
    );
  }
}
