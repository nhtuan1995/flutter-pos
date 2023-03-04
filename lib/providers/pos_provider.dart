import 'package:flutter/foundation.dart';

class PosProvider with ChangeNotifier {
  int _total = 0;
  int _discount = 0;

  int get total => _total;
  int get discount => _discount;

  void setDiscount(int value){
    _discount = value;
    notifyListeners();
  }

  void setTotal (int total){
    _total = total;
    notifyListeners();
  }

  void addTotal(int value){
    _total = _total + value;
    notifyListeners();
  }
  
}
