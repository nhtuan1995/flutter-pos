import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:pos/models/product_list.dart';
import 'package:pos/screens/pos/components/change_quantity.dart';
import 'package:provider/provider.dart';

// ignore: import_of_legacy_library_into_null_safe

class PosProductItem extends StatefulWidget {
  final int index;
  final List<Product> products;

  const PosProductItem({
    Key? key,
    required this.index,
    required this.products,
  }) : super(key: key);

  @override
  State<PosProductItem> createState() => _PosProductItemState();
}

class _PosProductItemState extends State<PosProductItem> {
  late int _totalPrice = widget.products[widget.index].price!;

  void changeItemCount(count) {
    setState(() {
      _totalPrice = count * widget.products[widget.index].price!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final posProvider = Provider.of<PosProvider>(context);
    return Container(
      width: screenSize(context).width,
      height: 100,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                "${widget.products[widget.index].image}",
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                      child: Text(
                        '${widget.products[widget.index].name}',
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: MainColors.kDefaultText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChangeQuantity(
                        onChange: (count) {
                          changeItemCount(count);
                          posProvider.addTotal(_totalPrice);
                        },
                      ),
                      Text(
                        renderPrice(price: _totalPrice),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MainColors.kDefaultText,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
