// ignore: duplicate_ignore
// ignore_for_file: import_of_legacy_library_into_null_safe, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/action_sheet/main_action_sheets.dart';

import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/components/button/rounded_button.dart';
import 'package:pos/components/input/vertical_input.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/pos/customer_search.dart';

// import 'package:custom_switch/custom_switch.dart';

// ignore: import_of_legacy_library_into_null_safe

class CustomerPicker extends StatefulWidget {
  const CustomerPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomerPicker> createState() => _CustomerPickerState();
}

class _CustomerPickerState extends State<CustomerPicker> {
  bool isShip = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 12,
        ),
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWellButton(
              onTap: () async {
                await Navigator.push(
                  // redirect màn !
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // if(type=='search'){}
                      return const CustomerSearch();
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/user.svg"),
                  const SizedBox(width: 8),
                  Text(
                    "Chọn khách hàng",
                    style: TextStyle(
                      color: MainColors.kDefaultLink,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Giao hàng",
                  style: TextStyle(
                    color: MainColors.kDefaultText,
                  ),
                ),
                Switch(
                    value: isShip,
                    onChanged: (bool value) {
                      if (value) {
                        showModalBottomSheet<dynamic>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: ((context) {
                            return MainActionSheet(
                              height: 460,
                              title: "Thông tin giao hàng",
                              body: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                child: Column(
                                  children: [
                                    const VerticalInput(
                                      label: "Địa chỉ giao hàng",
                                      hintText: "Vui lòng nhập địa chỉ",
                                    ),
                                    const SizedBox(height: 16),
                                    const VerticalInput(
                                      label: "Phí giao hàng",
                                      hintText: "Phí trả đối tác",
                                      isNumber: true,
                                    ),
                                    const SizedBox(height: 16),
                                    const ShipPayerRadio(),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 44,
                                      child: RoundedButton(
                                        title: "Lưu lại",
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      }
                      setState(() {
                        isShip = value;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShipPayerRadio extends StatefulWidget {
  const ShipPayerRadio({
    Key? key,
  }) : super(key: key);

  @override
  State<ShipPayerRadio> createState() => _ShipPayerRadioState();
}

enum ShipPayer { buyer, salesman }

class _ShipPayerRadioState extends State<ShipPayerRadio> {
  ShipPayer _shipPayer = ShipPayer.buyer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Người trả phí",
          style: TextStyle(
            color: MainColors.kDefaultText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: ShipPayer.salesman,
                      groupValue: _shipPayer,
                      onChanged: (index) {
                        setState(() {
                          _shipPayer = ShipPayer.salesman;
                        });
                      }),
                  Expanded(
                      child: Text(
                    'Người mua',
                    style: TextStyle(color: MainColors.kDefaultText),
                  ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      value: ShipPayer.buyer,
                      groupValue: _shipPayer,
                      onChanged: (index) {
                        setState(() {
                          _shipPayer = ShipPayer.buyer;
                        });
                      }),
                  Expanded(
                      child: Text(
                    'Người bán',
                    style: TextStyle(
                      color: MainColors.kDefaultText,
                    ),
                  ))
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
