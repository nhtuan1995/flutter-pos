import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/models/product_list.dart';

// ignore: import_of_legacy_library_into_null_safe

class SearchProductItem extends StatefulWidget {
  final int index;
  final List<Product> products;

  const SearchProductItem({
    Key? key,
    required this.index,
    required this.products,
  }) : super(key: key);

  @override
  State<SearchProductItem> createState() => _SearchProductItemState();
}

class _SearchProductItemState extends State<SearchProductItem> {
  late int _totalPrice = widget.products[widget.index].price!;
  int _count = 0;

  void changeItemCount(count) {
    setState(() {
      _totalPrice = count * widget.products[widget.index].price!;
    });
  }

  void increaseCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final posProvider = Provider.of<PosProvider>(context);
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          increaseCount();
        },
        child: SizedBox(
          width: screenSize(context).width,
          height: 100,
          // color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.network(
                      "${widget.products[widget.index].image}",
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _count > 0
                      ? Positioned(
                          top: -8,
                          right: -8,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: MainColors.kDefaultBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                _count.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(width: 0),
                ]),
                const SizedBox(width: 16),
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
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: MainColors.kDefaultText,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${widget.products[widget.index].sku} | Tồn : ${widget.products[widget.index].stock}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: MainColors.kDefaultTextSubdued,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        renderPrice(price: _totalPrice),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: MainColors.kDefaultText,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
