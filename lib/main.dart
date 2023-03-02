import 'package:flutter/material.dart';
import 'package:pos/constants.dart';
import 'package:pos/providers/pos_provider.dart';
import 'package:pos/screens/pos/pos_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PosProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: MainColors.kDefaultBlue),
          primarySwatch: Colors.blue,
        ),
        home: const POSScreen(),
      ),
    );
  }
}
