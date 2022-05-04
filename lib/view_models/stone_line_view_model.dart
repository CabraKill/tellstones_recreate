import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneLineViewModel extends ChangeNotifier {
  final List<StoneState?> _stoneLine;

  StoneLineViewModel({List<StoneState>? stoneLine})
      : _stoneLine = stoneLine ?? List.generate(7, (index) => null);

  UnmodifiableListView<StoneState?> get stoneLine =>
      UnmodifiableListView(_stoneLine);

  void onAccept(StoneType type, int index) {
    _stoneLine[index] = StoneState(
      type: type,
      turned: false,
      index: index,
    );
    notifyListeners();
  }
}
