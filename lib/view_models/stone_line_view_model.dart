import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/domain/stone_line_view_model.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneLineViewModelImpl extends ChangeNotifier
    implements StoneLineViewModel {
  final List<StoneState?> _stoneLine;

  StoneLineViewModelImpl({List<StoneState>? stoneLine})
      : _stoneLine = stoneLine ?? List.generate(7, (index) => null);

  @override
  UnmodifiableListView<StoneState?> getStoneLine() =>
      UnmodifiableListView(_stoneLine);

  @override
  void onAccept(StoneType type, int index) {
    _stoneLine[index] = StoneState(
      type: type,
      turned: false,
    );
    notifyListeners();
  }

  @override
  bool canPutStone(int index) {
    if (_stoneLine[3] == null) {
      if (index == 3) {
        return true;
      } else {
        return false;
      }
    }
    if (index < 3) {
      if (_stoneLine[index + 1] != null) {
        return true;
      } else {
        return false;
      }
    }
    if (_stoneLine[index - 1] != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void flipStone(int index) {
    _stoneLine[index] =
        _stoneLine[index]?.copyWith(turned: !_stoneLine[index]!.turned);
    notifyListeners();
  }
}
