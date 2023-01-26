import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'POS Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kDefaultBlue),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
