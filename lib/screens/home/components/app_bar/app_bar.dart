import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';
// import 'package:pos/extensions/color_extension.dart';
// ignore: import_of_legacy_library_into_null_safe

PreferredSize buildAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(
        64.0), // dùng cái này để làm cả cái thanh appbar dài ra , dùng để làm padding bottm
    child: AppBar(
      toolbarHeight: 64.0, // set chiều cao cho cái toolbar nó nằm vào giữa
      backgroundColor: kDefaultBlue,
      elevation: 0,
      leading: Container(
        padding: const EdgeInsets.only(left : 20),
        child: IconButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
          ),
          icon: SvgPicture.asset("assets/icons/close_icon.svg"),
          onPressed: () {},
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
                const SizedBox(width: 14),
                SvgPicture.asset("assets/icons/search.svg",
                    width: 16, height: 16),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Thêm sản phẩm",
                      border: InputBorder.none,
                      isDense: true, // tránh nó bị nhảy xuống dòng
                    ),
                    maxLines: 1,
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
    ),
  );
}
