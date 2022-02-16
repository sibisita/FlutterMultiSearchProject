import 'package:flutter/foundation.dart';

class FolderLocationProvider extends ChangeNotifier {
  String _saveLocation = "Select a folder.";
  String _searchLocation = "Select a folder.";
  bool _includeSubDirectory = false;

  String get savelocation => _saveLocation;
  String get searchlocation => _searchLocation;
  bool get includeSubDirectory => _includeSubDirectory;

  void searchLocationUpdater(location) {
    _searchLocation = location;
    notifyListeners();
  }

  void saveLocationUpdater(location) {
    _saveLocation = location;
    notifyListeners();
  }

  void includeSubDirectoryUpdater(value) {
    _includeSubDirectory = value;
    notifyListeners();
  }
}
