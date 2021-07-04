import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
 String odaText = "小田です";

  void changeOdaText() {
    odaText = "小田なんです";
    notifyListeners();
  }
}