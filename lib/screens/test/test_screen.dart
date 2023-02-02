import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        body: ListView(
          children: [
            Slidable(
              key: const ValueKey(0),
              endActionPane: ActionPane(
                extentRatio: 0.3, // làm cho cái nút nhỏ đi  
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const[
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    label: 'Xóa',
                  ),
                ],
              ),
              child: const ListTile(title: Text('Slide me to delete')),
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
