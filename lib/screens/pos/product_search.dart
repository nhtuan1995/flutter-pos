import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/screens/pos/components/app_bar.dart';
import 'package:pos/screens/pos/payment_screen.dart';

// import 'components/payment_info.dart';
import 'components/search_product_list.dart';

// ignore: import_of_legacy_library_into_null_safe

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        scaffoldColor: MainColors.kDefaultBackground,
        appBar: buildAppBar(context, 'search'),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  SearchProductList(),
                  SizedBox(height: 100),
                ],
              ),
            ),
            Expanded(child: Container()),
            //POSITION BOTTOM
            PositionedBottom(
              children: [
                SizedBox(
                  width: screenSize(context).width,
                  child: FullWidthButton(
                    title: 'Thêm vào đơn hàng',
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
