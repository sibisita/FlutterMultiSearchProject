import 'package:flutter/foundation.dart';

class SearchValuesProvider extends ChangeNotifier {
  String _searchValuesString = "";
  String get searchValuesString => _searchValuesString;

  void searchvaluesUpdater(values) {
    _searchValuesString = values.toLowerCase();
    notifyListeners();
  }
}
