import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/constants.dart';
// ignore: import_of_legacy_library_into_null_safe

class SelectOptionsTick extends StatefulWidget {
  final List<dynamic> data;
  final int index;
  const SelectOptionsTick({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<SelectOptionsTick> createState() => _SelectOptionsTickState();
}

class _SelectOptionsTickState extends State<SelectOptionsTick> {
  bool _isSelected = false;

  void handleSelectGroup() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      onTap: () => handleSelectGroup(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: MainColors.kDefaultInputBorder,
            width: 1.0,
          ),
        )),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.data[widget.index].name!,
              style: TextStyle(
                color: MainColors.kDefaultText,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            _isSelected
                ? SvgPicture.asset("assets/icons/tick_circle.svg", height: 18)
                : const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }
}
