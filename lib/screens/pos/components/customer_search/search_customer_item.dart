import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/constants.dart';
import 'package:pos/models/customer_list.dart';
// ignore: import_of_legacy_library_into_null_safe

class SearchCustomerItem extends StatefulWidget {
  final List<Customer> customers;
  final int index;
  const SearchCustomerItem({
    Key? key,
    required this.customers,
    required this.index,
  }) : super(key: key);

  @override
  State<SearchCustomerItem> createState() => _SearchCustomerItemState();
}

class _SearchCustomerItemState extends State<SearchCustomerItem> {
  bool _isSelected = false;

  void handleSelectGroup() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      color: Colors.white,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.customers[widget.index].name!,
                  style: TextStyle(
                    color: MainColors.kDefaultText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8, 
                ),
                Text(
                  widget.customers[widget.index].phone!,
                  style: TextStyle(
                    color: MainColors.kDefaultLink,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            _isSelected
                ? SvgPicture.asset("assets/icons/tick_circle.svg", height: 18)
                : const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }
}
