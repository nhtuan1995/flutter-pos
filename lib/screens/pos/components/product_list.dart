import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/sample/product_list.dart';
import 'package:pos/screens/pos/components/change_quantity.dart';

// ignore: import_of_legacy_library_into_null_safe

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                extentRatio: 0.3, // làm cho cái nút nhỏ đi
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    label: 'Xóa',
                  ),
                ],
              ),
              child: PosProductItem(
                index: index,
                products: products,
              ),
            );
          },
        ),
      ],
    );
  }
}

class PosProductItem extends StatelessWidget {
  final int index;
  final List<Product> products;

  const PosProductItem({
    Key? key,
    required this.index,
    required this.products,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final String itemPrice = renderPrice(price: products[index].price);
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
                "${products[index].image}",
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
                        '${products[index].name}',
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
                      const ChangeQuantity(),
                      Text(
                        itemPrice,
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
