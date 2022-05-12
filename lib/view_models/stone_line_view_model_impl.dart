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
  void onPut(StoneType type, int index) {
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
    _stoneLine[index] = _stoneLine[index]?.copyWith(
      turned: !_stoneLine[index]!.turned,
    );
    notifyListeners();
  }

  @override
  void onSelect(int index) {
    _stoneLine[index] = _stoneLine[index]?.copyWith(
      selected: !_stoneLine[index]!.selected,
    );
    notifyListeners();
  }

  @override
  List<int> getSelectedStonesIndexList() {
    List<int> selectedStonesIndexList = [];
    for (var i = 0; i < _stoneLine.length; i++) {
      if (_stoneLine[i]?.selected ?? false) {
        selectedStonesIndexList.add(i);
      }
    }
    return selectedStonesIndexList;
  }

  @override
  void switchStones() {
    final firstStoneIndex = getSelectedStonesIndexList()[0];
    final secondStoneIndex = getSelectedStonesIndexList()[1];
    final firstStone = _stoneLine[firstStoneIndex];
    final secondStone = _stoneLine[secondStoneIndex];

    _stoneLine[firstStoneIndex] =
        secondStone?.copyWith(selected: false);
    _stoneLine[secondStoneIndex] =
        firstStone?.copyWith(selected: false);
    notifyListeners();
  }
}
