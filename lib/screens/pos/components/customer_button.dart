import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pos/constants.dart';
import 'package:pos/extensions/screen_size.dart';

// ignore: import_of_legacy_library_into_null_safe

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
