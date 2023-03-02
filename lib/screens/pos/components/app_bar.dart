import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/pos/pos_screen.dart';
import 'package:pos/screens/pos/product_search.dart';
// ignore: import_of_legacy_library_into_null_safe

AppBar buildAppBar(context, String type) {
  return AppBar(
    toolbarHeight: 64.0, // set chiều cao cho cái toolbar nó nằm vào giữa
    backgroundColor: MainColors.kDefaultBlue,
    elevation: 0,
    leading: Container(
      padding: const EdgeInsets.only(left: 20),
      child: IconButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
        ),
        icon: SvgPicture.asset("assets/icons/close_icon.svg"),
        onPressed: () async {
          await Navigator.push(
            // redirect màn !
            context,
            MaterialPageRoute(
              builder: (context) => const POSScreen(),
            ),
          );
        },
      ),
    ),
    title: SizedBox(
        width: 295,
        height: 36,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Text(type, style: TextStyle(color: Colors.black)),
              const SizedBox(width: 14),
              SvgPicture.asset("assets/icons/search.svg",
                  width: 16, height: 16),
              const SizedBox(width: 10),
              Expanded(
                child: type == 'search'
                    ? TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Thêm sản phẩm",
                          border: InputBorder.none,
                          isDense: true, // tránh nó bị nhảy xuống dòng
                        ),
                        maxLines: 1,
                      )
                    : TextButton(
                        onPressed: () async {
                          await Navigator.push(
                            // redirect màn !
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductSearch(),
                            ),
                          );
                        },
                        child: Text(
                          'Thêm sản phẩm',
                        ),
                      ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/input_barcode.svg"),
              ),
              const SizedBox(width: 10),
            ],
          ),
        )),
  );
}
