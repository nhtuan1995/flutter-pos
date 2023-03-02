import 'package:flutter/foundation.dart';

class PosProvider with ChangeNotifier {
  int _total = 0;

  int get total => _total;
  
  void setTotal (int total){
    _total = total;
    notifyListeners();
  }

  void addTotal(int value){
    _total = _total + value;
    notifyListeners();
  }
  
}
