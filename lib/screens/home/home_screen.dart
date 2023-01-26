import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
// import 'package:pos/constants.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/sample/product_list.dart';
// import 'package:pos/sample/product_list.dart';
import 'package:pos/screens/home/components/app_bar/app_bar.dart';
import 'package:pos/screens/payment/payment_screen.dart';
// import 'package:pos/extensions/color_extension.dart';
// ignore: import_of_legacy_library_into_null_safe

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultBackground,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Column(
            children: const [
              CustomerButton(),
              SizedBox(
                height: 8,
              ),
              ProductList(),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenSize(context).width,
              color: kDefaultBackground,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tổng tiền hàng',
                                style: TextStyle(
                                    fontSize: 12, color: kDefaultText),
                              ),
                              Text(
                                renderPrice(price: 1500000),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kDefaultText,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'VAT',
                                style: TextStyle(
                                    fontSize: 12, color: kDefaultText),
                              ),
                              Text(
                                renderPrice(price: 0),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kDefaultText,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Giảm giá >',
                                style: TextStyle(
                                    fontSize: 12, color: kDefaultText),
                              ),
                              Text(
                                renderPrice(price: 0),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kDefaultText,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 24, right: 0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ghi chú',
                                style: TextStyle(
                                    fontSize: 12, color: kDefaultText),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Icon(Icons.edit_note),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 24, right: 24, bottom: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tổng tiền (4 sản phẩm)',
                                style: TextStyle(
                                    fontSize: 12, color: kDefaultText),
                              ),
                              Text(
                                renderPrice(price: 350000),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kDefaultText,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: screenSize(context).width,
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kDefaultBlue),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(14))),
                            onPressed: () async {
                              await Navigator.push(
                                  // redirect màn !
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Payment()));
                            },
                            child: const Text(
                              'Thanh toán',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (context, index) {
          String itemPrice = renderPrice(price: products[index].price);
          return Dismissible(
            direction: DismissDirection.endToStart,
            key: ValueKey(index),
            background: Container(
              color: Colors.red,
              child: const Center(
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                ),
              ),
            ),
            child: Container(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 32,
                            child: Text(
                              '${products[index].name}',
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kDefaultText,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${products[index].sku}',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: kDefaultTextSubdued,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            itemPrice,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kDefaultText,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0)),
                            ),
                            child: const Icon(Icons.remove),
                          ),
                        ),
                        Container(
                            width: 32,
                            height: 32,
                            padding: EdgeInsets.zero,
                            child: const Center(child: Text('01'))),
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(0)),
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomerButton extends StatelessWidget {
  const CustomerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize(context).width,
      height: 40,
      color: Colors.white,
      child: TextButton(
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/user.svg",
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Khách lẻ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kDefaultLink,
                    ),
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/icons/arrow_right.svg",
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
