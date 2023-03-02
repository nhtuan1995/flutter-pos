import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:pos/screens/pos/components/app_bar.dart';
import 'package:pos/screens/pos/payment_screen.dart';
import 'package:pos/screens/pos/components/customer_button.dart';
import 'package:provider/provider.dart';

import 'components/payment_info.dart';
import 'components/pos_product_list.dart';

// ignore: import_of_legacy_library_into_null_safe

class POSScreen extends StatelessWidget {
  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        scaffoldColor: MainColors.kDefaultBackground,
        appBar: buildAppBar(context, 'pos'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  CustomerButton(),
                  SizedBox(height: 8),
                  ProductList(),
                  SizedBox(
                    height: 8,
                  ),
                  PaymentInfo(),
                  SizedBox(height: 130),
                ],
              ),
            ),
            Expanded(child: Container()),
            //POSITION BOTTOM
            PositionedBottom(
              children: [
                SizedBox(
                  height: 36,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền (4 sản phẩm)',
                        style: TextStyle(
                            fontSize: 12, color: MainColors.kDefaultText),
                      ),
                      Consumer<PosProvider>(
                        builder: (context, value, child) {
                          return Text(
                            renderPrice(price: value.total),
                            style: TextStyle(
                              fontSize: 16,
                              color: MainColors.kDefaultText,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: screenSize(context).width,
                  child: FullWidthButton(
                    title: 'Hoàn thành',
                    onPressed: () async {
                      await Navigator.push(
                        // redirect màn !
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Payment(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
