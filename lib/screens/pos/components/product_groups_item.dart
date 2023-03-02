import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pos/models/product_groups.dart';

class ProductGroupItem extends StatefulWidget {
  final List<ProductGroups> productGroups;
  final int index;
  const ProductGroupItem({
    Key? key,
    required this.productGroups,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductGroupItem> createState() => _ProductGroupItemState();
}

class _ProductGroupItemState extends State<ProductGroupItem> {
  bool _isSelected = false;

  void handleSelectGroup() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => handleSelectGroup(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: MainColors.kDefaultInputBorder,
              width: 1.0,
            ),
          )),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.productGroups[widget.index].name!,
                style: TextStyle(
                  color: MainColors.kDefaultText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              _isSelected
                  ? SvgPicture.asset("assets/icons/tick_circle.svg", height: 18)
                  : const SizedBox(height: 18)
            ],
          ),
        ),
      ),
    );
  }
}
