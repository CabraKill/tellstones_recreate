import 'package:flutter/cupertino.dart';

class ConfigurationViewModel extends ChangeNotifier {
  int _maxPoints = 0;

  bool _isDragging = false;

  int get maxPoints => _maxPoints;

  void setMaxPoints(int maxPoints) {
    _maxPoints = maxPoints;
    notifyListeners();
  }

  bool get isDragging => _isDragging;
  
  void setIsDragging(bool isDragging) {
    _isDragging = isDragging;
    notifyListeners();
  }

}
