import 'package:flutter/material.dart';
import 'package:pos/constants.dart';

// // ignore: import_of_legacy_library_into_null_safe
// class ChangeQuantity extends StatelessWidget {
//   const ChangeQuantity({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         SizedBox(
//           width: 24,
//           height: 24,
//           child: OutlinedButton(
//             onPressed: () {},
//             style: ButtonStyle(
//               padding: MaterialStateProperty.all(
//                 const EdgeInsets.all(0),
//               ),
//             ),
//             child: Icon(
//               Icons.remove,
//               color: MainColors.kDefaultBlue,
//               size: 16,
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           height: 24,
//           padding: EdgeInsets.zero,
//           child: const Center(
//             child: Text('10000'),
//           ),
//         ),
//         const SizedBox(width: 8),
//         SizedBox(
//           width: 24,
//           height: 24,
//           child: OutlinedButton(
//             onPressed: () {},
//             style: ButtonStyle(
//               padding: MaterialStateProperty.all(
//                 const EdgeInsets.all(0),
//               ),
//             ),
//             child: Icon(
//               Icons.add,
//               color: MainColors.kDefaultBlue,
//               size: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class ChangeQuantity extends StatefulWidget {
  const ChangeQuantity({super.key});

  @override
  State<ChangeQuantity> createState() => _ChangeQuantityState();
}

class _ChangeQuantityState extends State<ChangeQuantity> {
  int _count = 0;

  void increase (){
    setState(() {
      _count++;
    });
  }

   void decrease (){
    if(_count == 0 ){
      setState(() {
        _count = 0;
      });
      return;
    }
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 24,
          height: 24,
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
        const SizedBox(width: 8),
        Container(
          height: 24,
          padding: EdgeInsets.zero,
          child: Center(
            child: Text(_count.toString(),
                style: TextStyle(
                  color: MainColors.kDefaultText,
                )),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 24,
          height: 24,
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
