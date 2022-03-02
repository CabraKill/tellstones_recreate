import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';

class StonePoolViewModel extends ChangeNotifier {
  final List<Stones> _stonePool;

  StonePoolViewModel({List<Stones>? stonePool})
      : _stonePool = stonePool ?? allStones;

  UnmodifiableListView<Stones> get stonePool => UnmodifiableListView(_stonePool);

  void addStone(Stones stones) {
    _stonePool.add(stones);
    notifyListeners();
  }

  void removeStones(Stones stones) {
    _stonePool.remove(stones);
    notifyListeners();
  }
}