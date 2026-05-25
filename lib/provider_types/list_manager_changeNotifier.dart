import 'package:flutter/cupertino.dart';

class ListManager extends ChangeNotifier {
  List<int> x = [for (int i = 0; i < 100; i++) i];

  void removeItem(int i) {
    x.remove(i);
    notifyListeners();
  }
}
