import 'package:flutter/material.dart';

import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';

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
          SizedBox(
            height: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Giảm giá >',
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
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
