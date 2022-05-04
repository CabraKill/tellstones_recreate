import 'package:flutter/cupertino.dart';

class TablePointsViewModel extends ChangeNotifier {
  double _playerOnePoints = 0;
  double _playerTwoPoints = 0;

  double get playerOnePoints => _playerOnePoints;

  double get playerTwoPoints => _playerTwoPoints;

  void addPlayerOnePoints(double points) {
    _playerOnePoints += points;
    notifyListeners();
  }

  void addPlayerTwoPoints(double points) {
    _playerTwoPoints += points;
    notifyListeners();
  }

  void resetPoints() {
    _playerOnePoints = 0;
    _playerTwoPoints = 0;
    notifyListeners();
  }
}
