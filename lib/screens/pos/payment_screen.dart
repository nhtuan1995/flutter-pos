import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/input/input_line.dart';
import 'package:pos/components/scaffold/main_appbar.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:pos/screens/pos/components/payment/single_payment.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

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
        Expanded(
          child: Container(
            color: Colors.white,
            child: Column(
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
                      PaymentTypesPicker(
                        onChange: (value) {
                          setState(() {
                            _paymentTypes = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      _paymentTypes == PaymentTypes.single
                          ? const SinglePayment()
                          : const MultiPayment(),
                    ],
                  ),
                ),
              ],
            ),
          ),
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

class MultiPayment extends StatelessWidget {
  const MultiPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hình thức thanh toán",
          style: TextStyle(
            color: MainColors.kDefaultText,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        InputLine(
          title: "Tiền mặt",
          icon:
              SvgPicture.asset("assets/icons/payment_cash_icon.svg", width: 28),
        ),
        InputLine(
          title: "Chuyển khoản",
          icon: SvgPicture.asset("assets/icons/payment_transfer_icon.svg",
              width: 28),
        ),
        InputLine(
          title: "Thẻ",
          icon:
              SvgPicture.asset("assets/icons/payment_card_icon.svg", width: 28),
        ),
        InputLine(
          title: "Ghi nợ",
          icon:
              SvgPicture.asset("assets/icons/payment_debt_icon.svg", width: 28),
        ),
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Khách thanh toán",
              style: TextStyle(
                color: MainColors.kDefaultText,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              renderPrice(price: 3500000),
              style: TextStyle(
                color: MainColors.kDefaultText,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 12),
          width: double.infinity,
          child: Text(
            "Tiền thừa: 485,000",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: MainColors.kDefaultText,
            ),
          ),
        ),
      ],
    );
  }
}

enum PaymentTypes { single, multi }

class PaymentTypesPicker extends StatefulWidget {
  final Function onChange;

  const PaymentTypesPicker({
    super.key,
    required this.onChange,
  });

  @override
  State<PaymentTypesPicker> createState() => _PaymentTypesPickerState();
}

class _PaymentTypesPickerState extends State<PaymentTypesPicker> {
  PaymentTypes _paymentTypes = PaymentTypes.single;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 36,
            decoration: BoxDecoration(
                border: Border.all(color: MainColors.kDefaultInputBorder),
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
                      widget.onChange(PaymentTypes.single);
                    }),
                Text(
                  'Một hình thức',
                  style: TextStyle(
                    color: _paymentTypes == PaymentTypes.multi
                        ? MainColors.kDefaultText
                        : MainColors.kDefaultBlue,
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
                border: Border.all(color: MainColors.kDefaultInputBorder),
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
                      widget.onChange(PaymentTypes.multi);
                    }),
                Text(
                  'Nhiều hình thức',
                  style: TextStyle(
                    color: _paymentTypes == PaymentTypes.single
                        ? MainColors.kDefaultText
                        : MainColors.kDefaultBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
