import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
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
  void onSelectForSwipe(int index) {
    _stoneLine[index] = _stoneLine[index]?.copyWith(
      isSelectedForSwipe: !_stoneLine[index]!.isSelectedForSwipe,
    );
    notifyListeners();
  }

  @override
  void onSelectForChallenge(int index) {
    var newStoneState = _stoneLine[index]?.copyWith(
      isSelectedForChallenge: !_stoneLine[index]!.isSelectedForChallenge,
    );
    for (int clearStoneIndex = 0;
        clearStoneIndex < _stoneLine.length;
        clearStoneIndex++) {
      _stoneLine[clearStoneIndex] =
          _stoneLine[clearStoneIndex]?.copyWith(isSelectedForChallenge: false);
    }
    _stoneLine[index] = newStoneState;
    notifyListeners();
  }

  @override
  List<int> getSelectedStonesForSwipeIndexList() {
    List<int> selectedStonesIndexList = [];
    for (var i = 0; i < _stoneLine.length; i++) {
      if (_stoneLine[i]?.isSelectedForSwipe ?? false) {
        selectedStonesIndexList.add(i);
      }
    }
    return selectedStonesIndexList;
  }

  @override
  void switchStones() {
    final firstStoneIndex = getSelectedStonesForSwipeIndexList()[0];
    final secondStoneIndex = getSelectedStonesForSwipeIndexList()[1];
    final firstStone = _stoneLine[firstStoneIndex];
    final secondStone = _stoneLine[secondStoneIndex];

    _stoneLine[firstStoneIndex] =
        secondStone?.copyWith(isSelectedForSwipe: false);
    _stoneLine[secondStoneIndex] =
        firstStone?.copyWith(isSelectedForSwipe: false);
    notifyListeners();
  }

  @override
  bool isAnyStoneSeletecForChallenge() {
    return _getStoneListForChallenge().isNotEmpty;
  }

  @override
  StoneType? getCurrentStoneTypeForChallenge() {
    try {
      return _getStoneListForChallenge().first?.type;
    } catch (e) {
      return null;
    }
  }

  Iterable<StoneState?> _getStoneListForChallenge() {
    return _stoneLine.where((stone) => stone?.isSelectedForChallenge == true);
  }
}
