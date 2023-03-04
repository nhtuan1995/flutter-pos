import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos/constants.dart';
// ignore: import_of_legacy_library_into_null_safe

class MainActionSheet extends StatelessWidget {
  final String title;
  final Widget body;

  const MainActionSheet({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 12,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          "assets/icons/close_icon.svg",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            color: MainColors.kDefaultBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    )
                  ],
                ),
              ),
              Expanded(child: body)
            ],
          )),
    );
  }
}
