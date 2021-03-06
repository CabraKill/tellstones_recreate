import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/domain/table_points_view_model.dart';

class TablePointsViewModelImpl extends ChangeNotifier implements TablePointsViewModel {
  double _playerOnePoints = 0;
  double _playerTwoPoints = 0;

  @override
  double getPlayerOnePoints() => _playerOnePoints;

  @override
  double getPlayerTwoPoints() => _playerTwoPoints;

  @override
  void addPlayerOnePoints(double points) {
    _playerOnePoints += points;
    notifyListeners();
  }

  @override
  void addPlayerTwoPoints(double points) {
    _playerTwoPoints += points;
    notifyListeners();
  }

  @override
  void resetPoints() {
    _playerOnePoints = 0;
    _playerTwoPoints = 0;
    notifyListeners();
  }
}
