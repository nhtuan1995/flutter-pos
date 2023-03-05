import 'package:flutter/material.dart';
import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/input/input_line.dart';
import 'package:pos/components/scaffold/main_appbar.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

enum PaymentTypes { single, multi }

class _PaymentState extends State<Payment> {
  PaymentTypes _paymentTypes = PaymentTypes.single;

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
          'Xác nhận thanh toán',
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
              color: Colors.white,
              child: Column(
                children: [
                  Consumer<PosProvider>(
                    builder: (context, value, child) {
                      return Text(
                        renderPrice(price: value.total),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: MainColors.kDefaultBlue,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: MainColors.kDefaultInputBorder),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Radio(
                                  activeColor: MainColors.kDefaultBlue,
                                  value: PaymentTypes.single,
                                  groupValue: _paymentTypes,
                                  onChanged: (index) {
                                    setState(() {
                                      _paymentTypes = PaymentTypes.single;
                                    });
                                  }),
                              Text(
                                'Một hình thức',
                                style: TextStyle(
                                  color: _paymentTypes == PaymentTypes.multi ? MainColors.kDefaultText : MainColors.kDefaultBlue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 151,
                          height: 36,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: MainColors.kDefaultInputBorder),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Radio(
                                  activeColor: MainColors.kDefaultBlue,
                                  value: PaymentTypes.multi,
                                  groupValue: _paymentTypes,
                                  onChanged: (index) {
                                    setState(() {
                                      _paymentTypes = PaymentTypes.multi;
                                    });
                                  }),
                              Text(
                                'Nhiều hình thức',
                                style: TextStyle(
                                  color: _paymentTypes == PaymentTypes.single ? MainColors.kDefaultText : MainColors.kDefaultBlue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // const InputLine(
                  //   title: "Tiền mặt",
                  // ),
                  // const InputLine(
                  //   title: "Quẹt thẻ",
                  // ),
                  // const InputLine(
                  //   title: "Chuyển khoản",
                  // ),
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
