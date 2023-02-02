import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/components/button/full_width_button.dart';
import 'package:pos/components/scaffold/main_scaffold.dart';
import 'package:pos/components/scaffold/position_bottom_component.dart';
import 'package:pos/constants.dart';
import 'package:pos/extensions/render_currency.dart';
import 'package:pos/extensions/screen_size.dart';
import 'package:pos/sample/product_list.dart';
import 'package:pos/screens/home/components/app_bar/app_bar.dart';
import 'package:pos/screens/payment/payment_screen.dart';

// ignore: import_of_legacy_library_into_null_safe

class POSScreen extends StatelessWidget {
  const POSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        scaffoldColor: MainColors.kDefaultBackground,
        appBar: buildAppBar(context),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: const [
                  CustomerButton(),
                  SizedBox(
                    height: 8,
                  ),
                  ProductList(),
                  SizedBox(
                    height: 8,
                  ),
                  PaymentInfo(),
                  SizedBox(
                    height: 130,
                  ),
                ],
              ),
            ),

            //POSITION BOTTOM
            PositionedBottom(
              children: [
                SizedBox(
                  height: 36,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền (4 sản phẩm)',
                        style: TextStyle(
                            fontSize: 12, color: MainColors.kDefaultText),
                      ),
                      Text(
                        renderPrice(price: 350000),
                        style: TextStyle(
                          fontSize: 16,
                          color: MainColors.kDefaultText,
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
                  child: FullWidthButton(
                    title: 'Hoàn thành',
                    onPressed: () async {
                      await Navigator.push(
                          // redirect màn !
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Payment()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fontSize: 12,
                    color: MainColors.kDefaultText,
                  ),
                ),
                Text(
                  renderPrice(price: 1500000),
                  style: TextStyle(
                    fontSize: 14,
                    color: MainColors.kDefaultText,
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
                  style:
                      TextStyle(fontSize: 12, color: MainColors.kDefaultText),
                ),
                Text(
                  renderPrice(price: 0),
                  style: TextStyle(
                    fontSize: 14,
                    color: MainColors.kDefaultText,
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
                  style:
                      TextStyle(fontSize: 12, color: MainColors.kDefaultText),
                ),
                Text(
                  renderPrice(price: 0),
                  style: TextStyle(
                    fontSize: 14,
                    color: MainColors.kDefaultText,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            String itemPrice = renderPrice(price: products[index].price);
            return 
            Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                extentRatio: 0.3, // làm cho cái nút nhỏ đi  
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: (context){},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    label: 'Xóa',
                  ),
                ],
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
                                  color: MainColors.kDefaultText,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${products[index].sku}',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: MainColors.kDefaultTextSubdued,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              itemPrice,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: MainColors.kDefaultText,
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
      ],
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
                      color: MainColors.kDefaultText,
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
