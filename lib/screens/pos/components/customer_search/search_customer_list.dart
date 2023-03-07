import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/constants.dart';
import 'package:pos/models/customer_list.dart';
import 'package:pos/screens/pos/components/customer_search/search_customer_item.dart';

// ignore: import_of_legacy_library_into_null_safe

class SearchCustomerList extends StatelessWidget {
  const SearchCustomerList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customers.isNotEmpty
        ? ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: customers.length,
            itemBuilder: (context, index) {
              return SearchCustomerItem(customers: customers, index: index);
            },
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
