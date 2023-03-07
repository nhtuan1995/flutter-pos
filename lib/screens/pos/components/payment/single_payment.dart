import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/pos/components/payment/payment_types_button.dart';
import 'package:pos/screens/pos/components/payment/payment_vertical_input.dart';

class SinglePayment extends StatefulWidget {
  const SinglePayment({
    Key? key,
  }) : super(key: key);

  @override
  State<SinglePayment> createState() => _SinglePaymentState();
}

class _SinglePaymentState extends State<SinglePayment> {
  String _singlePayType = "cash";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PaymentVerticalInput(
          label: "Khách thanh toán",
          textAlign: TextAlign.right,
          isNumber: true,
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
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
              height: 16,
            ),
            Row(
              children: [
                PaymentTypesButton(
                  iconLink: "assets/icons/payment_cash_icon.svg",
                  backgroundColor: MainColors.kSuccess50,
                  borderColor: MainColors.kSuccess600,
                  label: "Tiền mặt",
                  payTypeState: _singlePayType,
                  value: "cashPayment",
                  onSelected: (value) {
                    setState(() {
                      _singlePayType = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                PaymentTypesButton(
                  iconLink: "assets/icons/payment_transfer_icon.svg",
                  backgroundColor: MainColors.kInformative50,
                  borderColor: MainColors.kInformative600,
                  label: "Thẻ",
                  payTypeState: _singlePayType,
                  value: "transferPayment",
                  onSelected: (value) {
                    setState(() {
                      _singlePayType = value;
                    });
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                PaymentTypesButton(
                  iconLink: "assets/icons/payment_card_icon.svg",
                  backgroundColor: MainColors.kWarning50,
                  borderColor: MainColors.kWarning600,
                  label: "Thẻ",
                  payTypeState: _singlePayType,
                  value: "cardPayment",
                  onSelected: (value) {
                    setState(() {
                      _singlePayType = value;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
