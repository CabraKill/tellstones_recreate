import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';

class StoneLineViewModel extends ChangeNotifier {
  final List<Stones> _stoneLine;

  StoneLineViewModel({List<Stones>? stoneLine}) : _stoneLine = stoneLine ?? [];

  UnmodifiableListView<Stones> get stoneLine =>
      UnmodifiableListView(_stoneLine);

  void addStoneToRight(Stones stones) {
    _stoneLine.add(stones);
    notifyListeners();
  }

  void addStoneToLeft(Stones stones) {
    _stoneLine.insert(0, stones);
    notifyListeners();
  }

  void removeStone(Stones stones) {
    _stoneLine.remove(stones);
    notifyListeners();
  }
}
