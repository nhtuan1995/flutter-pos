import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/pos/components/app_bar.dart';
import 'package:pos/screens/pos/components/customer_search/search_customer_list.dart';
import 'package:pos/screens/pos/create_customer.dart';
// ignore: import_of_legacy_library_into_null_safe

class CustomerSearch extends StatelessWidget {
  const CustomerSearch({super.key});

  @override
  Widget build(BuildContext context) {
  // ignore: no_leading_underscores_for_local_identifiers
  void _createCustomer() async {
      await Navigator.push(
        // redirect màn !
        context,
        MaterialPageRoute(
          builder: (context) => const CreateCustomer(),
        ),
      );
    }
    return MainScaffold(
        scaffoldColor: MainColors.kDefaultBackground,
        appBar: buildAppBar(context, 'search', _createCustomer),
        body: Stack(
          children: const [
            SingleChildScrollView(
              child: SearchCustomerList(),
            ),
          ],
        ));
  }
}
