// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// import 'package:pos/extensions/render_currency.dart';
import 'package:pos/models/product_list.dart';
import 'package:pos/screens/pos/components/pos/pos_product_item.dart';

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
