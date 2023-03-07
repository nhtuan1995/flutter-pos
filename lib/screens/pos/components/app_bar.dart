import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/pos/pos_screen.dart';
import 'package:pos/screens/pos/product_search.dart';
// ignore: import_of_legacy_library_into_null_safe

AppBar buildAppBar(context, String type, Function onCreate) {
  String barcodeScanRes;
  Future<void> scan() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sản phẩm được quét :'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Mã Barcode : $barcodeScanRes'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Thoát'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

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
        icon: type == 'search'
            ? SvgPicture.asset("assets/icons/arrow_left.svg")
            : SvgPicture.asset("assets/icons/close_icon.svg"),
        onPressed: () async {
          await Navigator.push(
            // redirect màn !
            context,
            MaterialPageRoute(
              builder: (context) {
                // if(type=='search'){}
                return const POSScreen();
              },
            ),
          );
        },
      ),
    ),
    title: Expanded(
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),
            SvgPicture.asset("assets/icons/search.svg", width: 16, height: 16),
            const SizedBox(width: 10),
            Expanded(
              child: type == 'search'
                  ? TextField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Nhập tên, SKU...",
                        border: InputBorder.none,
                        isDense: true, // tránh nó bị nhảy xuống dòng
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        color: MainColors.kDefaultText,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Thêm sản phẩm',
                            style: TextStyle(
                              color: MainColors.kDefaultText,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: SvgPicture.asset("assets/icons/input_barcode.svg"),
              onPressed: () => scan(),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    ),
    actions: [
      type == 'search'
          ? IconButton(
              onPressed: () => onCreate(),
              icon: const Icon(Icons.add),
            )
          : const SizedBox(width: 0),
      const SizedBox(width: 10),
    ],
  );
}
