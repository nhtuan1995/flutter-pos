import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/components/button/ink_well_button.dart';
import 'package:pos/constants.dart';
import 'package:pos/models/product_list.dart';
import 'package:pos/screens/pos/components/product_groups_action_sheet.dart';
import 'package:pos/screens/pos/components/search_product_item.dart';

// ignore: import_of_legacy_library_into_null_safe

class SearchProductList extends StatelessWidget {
  const SearchProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWellButton(
                color: Colors.white,
                onTap: () {
                  showModalBottomSheet<dynamic>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: ((context) {
                      return const ProductGroupsActionSheet();
                    }),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    children: [
                      Text(
                        "Tất cả loại sản phẩm",
                        style: TextStyle(
                          color: MainColors.kDefaultText,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset("assets/icons/angle_down.svg")
                    ],
                  ),
                ),
              ),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return SearchProductItem(
                    index: index,
                    products: products,
                  );
                },
              ),
            ],
          )
        : SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/icons/empty_list_image.svg"),
                    Text(
                      "Không tìm thấy kết quả",
                      style: TextStyle(
                        color: MainColors.kDefaultText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
