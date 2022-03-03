import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stone_state.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';

class StoneLineViewModel extends ChangeNotifier {
  final List<StoneState> _stoneLine;

  StoneLineViewModel({List<StoneState>? stoneLine})
      : _stoneLine = stoneLine ?? [];

  UnmodifiableListView<StoneState> get stoneLine =>
      UnmodifiableListView(_stoneLine);

  void addStoneToRight(Stones stone) {
    final stoneState =
        StoneState(type: stone, turned: false, index: _stoneLine.length);
    _stoneLine.add(stoneState);
    notifyListeners();
  }

  void addStoneToLeft(Stones stone) {
    final stoneState = StoneState(type: stone, turned: false, index: 0);
    _stoneLine.insert(0, stoneState);
    notifyListeners();
  }

  void removeStone(Stones stone) {
    _stoneLine.removeWhere((stoneState) => stoneState.type == stone);
    notifyListeners();
  }
}
