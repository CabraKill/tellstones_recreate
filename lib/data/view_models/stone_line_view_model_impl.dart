import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneLineViewModelImpl extends ChangeNotifier
    implements StoneLineViewModel {
  static const int _stoneLength = 7;
  static const int _middleIndexOfStoneList = 3;
  final List<StoneState?> _stoneLine;

  StoneLineViewModelImpl({List<StoneState>? stoneLine})
      : _stoneLine = stoneLine ?? List.generate(_stoneLength, (index) => null);

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
      return index == _middleIndexOfStoneList ? true : false;
    }
    if (index < _middleIndexOfStoneList) {
      return _stoneLine[index + 1] != null ? true : false;
    }

    return _stoneLine[index - 1] != null ? true : false;
  }

  @override
  void flipStone(int index) {
    final stoneInLine = _stoneLine[index];
    _stoneLine[index] = stoneInLine?.copyWith(
      turned: !stoneInLine.turned,
    );
    notifyListeners();
  }

  @override
  void onSelectForSwipe(int index) {
    final stoneInLine = _stoneLine[index];
    _stoneLine[index] = stoneInLine?.copyWith(
      isSelectedForSwipe: !stoneInLine.isSelectedForSwipe,
    );
    notifyListeners();
  }

  @override
  void onSelectForChallenge(int index) {
    final stoneInLine = _stoneLine[index];
    var newStoneState = stoneInLine?.copyWith(
      isSelectedForChallenge: !stoneInLine.isSelectedForChallenge,
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
    final selectedStonesForSwipeIndexList =
        getSelectedStonesForSwipeIndexList();
    final firstStoneIndex = selectedStonesForSwipeIndexList.first;
    final secondStoneIndex = selectedStonesForSwipeIndexList[1];
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
