import 'package:flutter/cupertino.dart';

class SearchHistoryModel extends ChangeNotifier {
  List<String> _history;

  SearchHistoryModel(this._history);

  void addItem(String item) {
    removeItem(item);
    _history.insert(0, item);
    notifyListeners();
  }

  void removeItem(String item) {
    _history.removeWhere((element) => element == item);
    notifyListeners();
  }

  List<String> getList() {
    return _history;
  }
}