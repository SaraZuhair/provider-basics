import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ProviderExample extends ChangeNotifier {
  double num = 0;

  changenum() {
    num++;
    notifyListeners();
  }
}
