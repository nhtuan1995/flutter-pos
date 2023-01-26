import 'package:intl/intl.dart';

String renderPrice ({int? price = 0}){
  return  NumberFormat.decimalPattern().format(price);
}