import 'package:flutter/material.dart';
import 'package:pos/components/action_sheet/main_action_sheets.dart';
import 'package:pos/components/button/rounded_button.dart';
import 'package:pos/constants.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:provider/provider.dart';

// ignore: import_of_legacy_library_into_null_safe

class DiscountActionSheet extends StatefulWidget {
  const DiscountActionSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscountActionSheet> createState() => _DiscountActionSheetState();
}

enum DiscountType {
  percentage,
  cash,
}

class _DiscountActionSheetState extends State<DiscountActionSheet> {
  late DiscountType discountType = DiscountType.cash;

  void setDiscountType(value) {
    setState(() {
      discountType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final posProvider = Provider.of<PosProvider>(context);
    return MainActionSheet(
      title: "Giảm giá",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  isSelected: discountType == DiscountType.cash,
                  title: "Giá trị",
                  onPressed: () => setDiscountType(DiscountType.cash),
                ),
                const SizedBox(width: 16),
                RoundedButton(
                  isSelected: discountType == DiscountType.percentage,
                  title: "%",
                  onPressed: () => setDiscountType(DiscountType.percentage),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              color: MainColors.kBlue50,
              height: 70,
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true, // tránh nó bị nhảy xuống dòng
                  ),
                  style: TextStyle(
                    color: MainColors.kDefaultBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: RoundedButton(
                isSelected: true,
                title: "Xác nhận",
                onPressed: () {
                  posProvider.setDiscount(150000);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
