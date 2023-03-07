import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/action_sheet/main_action_sheets.dart';

import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/components/button/rounded_button.dart';
import 'package:pos/constants.dart';

// import 'package:custom_switch/custom_switch.dart';

// ignore: import_of_legacy_library_into_null_safe

class NoteButton extends StatelessWidget {
  const NoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      onTap: () {
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: ((context) {
            return MainActionSheet(
              height: 300,
              title: "Ghi chú đơn hàng",
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MainColors.kDefaultInputBorder,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: const TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Thêm ghi chú",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: RoundedButton(
                          title: "Lưu lại",
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      },
      child: Container(
        color: Colors.white,
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ghi chú đơn hàng",
              style: TextStyle(color: MainColors.kDefaultText),
            ),
            SvgPicture.asset("assets/icons/edit_icon.svg")
          ],
        ),
      ),
    );
  }
}
