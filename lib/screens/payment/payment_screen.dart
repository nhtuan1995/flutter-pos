import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            64.0), // dùng cái này để làm cả cái thanh appbar dài ra , dùng để làm padding bottm
        child: AppBar(
            toolbarHeight:
                64.0, // set chiều cao cho cái toolbar nó nằm vào giữa
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Thanh toán',
              style: TextStyle(
                fontSize: 16,
                color: kDefaultBlue,
              ),
            )),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            width: screenSize(context).width,
            child: Column(
              children: [
                Text(
                  'Tổng khách cần trả',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kDefaultText,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  renderPrice(price: 3015000),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: kDefaultBlue,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(
                  height: 36,
                  child: Row(
                    children: [
                      Text(
                        'Khách thanh toán',
                        style: TextStyle(fontSize: 12, color: kDefaultText),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 52,
                  child: Row(
                    children: [
                      Text(
                        'Tiền mặt',
                        style: TextStyle(fontSize: 12, color: kDefaultText),
                      ),
                       Expanded(
                         child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Thêm sản phẩm",
                            // border: InputBorder.none,
                            isDense: true, // tránh nó bị nhảy xuống dòng
                          ),
                          maxLines: 1,
                                             ),
                       )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
