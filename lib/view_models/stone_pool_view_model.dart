import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

class StonePoolViewModel extends ChangeNotifier {
  final List<StoneType> _stonePool;

  StonePoolViewModel({List<StoneType>? stonePool})
      : _stonePool = stonePool ?? List.from(StoneType.values);

  UnmodifiableListView<StoneType> get stonePool => UnmodifiableListView(_stonePool);

  void removeStone(StoneType stones) {
    _stonePool.remove(stones);
    notifyListeners();
  }
}
