import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/domain/view_models/current_users_action_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class CurrentUsersActionViewModelImpl extends ChangeNotifier
    implements CurrentUsersActionViewModel { 
  ActionsType? _currentAction;
  bool _isUser1Turn = true;

  @override
  ActionsType? getCurrentAction() {
    return _currentAction;
  }

  @override
  void setCurrentAction(ActionsType action) {
    if (action == _currentAction) {
      return;
    }
    _currentAction = action;
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
    _currentAction = null;
    notifyListeners();
  }
}
