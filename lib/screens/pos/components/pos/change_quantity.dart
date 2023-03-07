import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

// // ignore: import_of_legacy_library_into_null_safe
// class ChangeQuantity extends StatelessWidget {
//   const ChangeQuantity({
//     Key? key,
//   }) : super(key: key);

class ChangeQuantity extends StatefulWidget {
  final Function onChange;
  const ChangeQuantity({super.key, required this.onChange});

  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  int _count = 1;

  void increase() {
    setState(() {
      _count++;
    });
    widget.onChange(_count);
  }

  void decrease() {
    if (_count == 0) {
      setState(() {
        _count = 0;
      });
      widget.onChange(_count);
      return;
    }
    setState(() {
      _count--;
      widget.onChange(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 32,
          height: 32,
          child: OutlinedButton(
            onPressed: () => decrease(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(0),
              ),
            ),
            child: Icon(
              Icons.remove,
              color: MainColors.kDefaultBlue,
              size: 16,
            ),
          ),
        ),
        Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Text(_count.toString(),
                style: TextStyle(
                  color: MainColors.kDefaultText,
                )),
          ),
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: OutlinedButton(
            onPressed: () => increase(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(0),
              ),
            ),
            child: Icon(
              Icons.add,
              color: MainColors.kDefaultBlue,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
