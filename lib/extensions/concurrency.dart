import 'dart:core';
import 'package:intl/intl.dart';

extension Concurrency on num {
  String formatToMoney() {
    final f = NumberFormat("###,###.00##", "pt_BR");
    return f.format(this);
  }
}
