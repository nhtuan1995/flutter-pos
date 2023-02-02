import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final AppBar appBar;
  final Widget body;
  final Color appBarColor ;
  final Color scaffoldColor;

  const MainScaffold({
    required this.appBar,
    required this.body,
    this.appBarColor = Colors.white,
    this.scaffoldColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset:false, 
        // resizeToAvoidBottomInset:false : nếu mà có bàn phím thì ko đẩy cái Positioned lên
        backgroundColor: appBarColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0), 
          // preferredSize : dùng cái này để làm cả cái thanh appbar cao lên , dùng để làm padding bottom cho cái AppBar
          child: appBar,
        ),
        body: SafeArea(
          top: false,
          child: Container(
            color: scaffoldColor,
            child: body,
          ),
        ),
      ),
    );
  }
}
