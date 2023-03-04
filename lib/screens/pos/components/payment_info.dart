import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/components/button/ink_well_button.dart';

import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:pos/screens/pos/components/discount_action_sheet.dart';
import 'package:provider/provider.dart';

// ignore: import_of_legacy_library_into_null_safe

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng tiền hàng',
                  style: TextStyle(
                    fontSize: 12,
                    color: MainColors.kDefaultText,
                  ),
                ),
                Text(
                  renderPrice(price: 1500000),
                  style: TextStyle(
                    fontSize: 14,
                    color: MainColors.kDefaultText,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'VAT',
                  style:
                      TextStyle(fontSize: 12, color: MainColors.kDefaultText),
                ),
                Text(
                  renderPrice(price: 0),
                  style: TextStyle(
                    fontSize: 14,
                    color: MainColors.kDefaultText,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          InkWellButton(
            onTap: () {
              showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: ((context) {
                  return const DiscountActionSheet();
                }),
              );
            },
            child: SizedBox(
              height: 36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Giảm giá",
                    style:
                        TextStyle(fontSize: 12, color: MainColors.kDefaultText),
                  ),
                  Row(children: [
                    Consumer<PosProvider>(
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            Text(
                              renderPrice(price: value.discount),
                              style: TextStyle(
                                fontSize: 14,
                                color: value.discount == 0
                                    ? MainColors.kDefaultText
                                    : MainColors.kDefaultLink,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            value.discount > 0
                                ? Row(
                                  children: [
                                    const SizedBox(width : 6),
                                    SvgPicture.asset("assets/icons/edit_icon.svg"),
                                  ],
                                )
                                : const SizedBox(width: 0)
                          ],
                        );
                      },
                    ),
                  ])
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
