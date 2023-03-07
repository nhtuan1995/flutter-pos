import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/constants.dart';

class DatePickerActionButton extends StatelessWidget {
  final String label;
  final String modalLabel;

  const DatePickerActionButton({
    Key? key,
    required this.label,
    required this.modalLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      onTap: () {
        // showModalBottomSheet<dynamic>(
        //   context: context,
        //   isScrollControlled: true,
        //   backgroundColor: Colors.transparent,
        //   builder: ((context) {
        //     return MainActionSheet(
        //       height: screenSize(context).height - 75,
        //       title: modalLabel,
        //       body: Container(
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        //           child: Text("This is clock")),
        //     );
        //   }),
        // );
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
          
        );
      },
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: MainColors.kDefaultInputBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            label,
            style: TextStyle(
              color: MainColors.kDefaultTextSubdued,
            ),
          ),
          SvgPicture.asset(
            "assets/icons/calendar.svg",
            color: Colors.black,
          ),
        ]),
      ),
    );
  }
}

class ActionSheetSearch extends StatelessWidget {
  const ActionSheetSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: MainColors.kDefaultDisabledInput,
        border: Border.all(color: MainColors.kDefaultInputBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: TextField(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: MainColors.kDefaultText,
            ),
            decoration: const InputDecoration(
              hintText: "Tìm kiếm",
              border: InputBorder.none,
            ),
          ),
        ),
        SvgPicture.asset(
          "assets/icons/search.svg",
          width: 14,
          color: MainColors.kDefaultTextSubdued,
        ),
      ]),
    );
  }
}
