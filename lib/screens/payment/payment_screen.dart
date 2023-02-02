import 'package:flutter/material.dart';
import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/input/input_line.dart';
import 'package:pos/components/scaffold/main_appbar.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffoldColor: MainColors.kDefaultBackground,
      appBar: mainAppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: BackButton(
            color: MainColors.kDefaultBlack,
          ),
        ),
        title: Text(
          'Thanh toán',
          style: TextStyle(
            fontSize: 18,
            color: MainColors.kDefaultBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              width: screenSize(context).width,
              color: MainColors.kDefaultBackground,
              child: Column(
                children: [
                  Text(
                    'Tổng khách cần trả',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: MainColors.kDefaultText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    renderPrice(price: 3015000),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: MainColors.kDefaultBlue,
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    height: 36,
                    child: Row(
                      children: [
                        Text(
                          'Khách thanh toán',
                          style: TextStyle(
                              fontSize: 14,
                              color: MainColors.kDefaultText,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const InputLine(
                    title: "Tiền mặt",
                  ),
                  const InputLine(
                    title: "Quẹt thẻ",
                  ),
                  const InputLine(
                    title: "Chuyển khoản",
                  ),
                ],
              ),
            ),
          ],
        ),
        PositionedBottom(
          children: [
            SizedBox(
              width: screenSize(context).width,
              // ignore: prefer_const_constructors
              child: FullWidthButton(
                title: 'Hoàn thành',
                onPressed: (){},
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

