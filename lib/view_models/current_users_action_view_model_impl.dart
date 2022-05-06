import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/domain/current_users_action_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class CurrentUsersActionViewModelImpl extends ChangeNotifier
    implements CurrentUsersActionViewModel {
  ActionsType? _currentActionUser1;
  ActionsType? _currentActionUser2;
  int _currentUserIndex = 0;

  @override
  ActionsType? getCurrentActionUser1() {
    return _currentActionUser1;
  }

  @override
  void setCurrentActionUser1(ActionsType action) {
    _currentActionUser1 = action;
    notifyListeners();
  }

  @override
  ActionsType? getCurrentActionUser2() {
    return _currentActionUser2;
  }

  @override
  void setCurrentActionUser2(ActionsType action) {
    _currentActionUser2 = action;
    notifyListeners();
  }

  @override
  int getCurrentUserIndex() {
    return _currentUserIndex;
  }

  @override
  void setCurrentUserIndex(int index) {
    if (index == 0) {
      _currentActionUser2 = null;
    } else {
      _currentActionUser1 = null;
    }
    _currentUserIndex = index;
    notifyListeners();
  }
}
