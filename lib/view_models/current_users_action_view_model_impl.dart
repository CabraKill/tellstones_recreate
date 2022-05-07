import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/domain/current_users_action_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class CurrentUsersActionViewModelImpl extends ChangeNotifier
    implements CurrentUsersActionViewModel {
  ActionsType? _currentActionUser1;
  ActionsType? _currentActionUser2;
  bool _isUser1Turn = true;

  @override
  ActionsType? getCurrentActionUser1() {
    return _currentActionUser1;
  }

  @override
  void setCurrentActionUser1(ActionsType action) {
    if (action == _currentActionUser1) {
      return;
    }
    _currentActionUser1 = action;
    notifyListeners();
  }

  @override
  ActionsType? getCurrentActionUser2() {
    return _currentActionUser2;
  }

  @override
  void setCurrentActionUser2(ActionsType action) {
    if (action == _currentActionUser2) {
      return;
    }
    _currentActionUser2 = action;
    notifyListeners();
  }

  @override
  bool getIsUser1Turn() {
    return _isUser1Turn;
  }

  @override
  bool getIsUser2Turn() {
    return !_isUser1Turn;
  }

  @override
  void setIsUser1Turn(bool isUser1Turn) {
    if (isUser1Turn == _isUser1Turn) {
      return;
    }
    _isUser1Turn = isUser1Turn;
    notifyListeners();
  }

  @override
  void setIsUser2Turn(bool isUser2Turn) {
    if (isUser2Turn == !_isUser1Turn) {
      return;
    }
    _isUser1Turn = !isUser2Turn;
    notifyListeners();
  }

  @override
  void switchUser() {
    _isUser1Turn = !_isUser1Turn;
    _currentActionUser1 = null;
    _currentActionUser2 = null;
    notifyListeners();
  }
}
