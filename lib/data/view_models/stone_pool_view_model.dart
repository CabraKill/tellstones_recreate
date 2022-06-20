import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tellstones_recreate/domain/view_models/stone_pool_view_model.dart';

import 'package:tellstones_recreate/models/stones_enum.dart';

class StonePoolViewModelImpl extends ChangeNotifier
    implements StonePoolViewModel {
  final List<StoneType> _stonePool;

  StonePoolViewModelImpl({List<StoneType>? stonePool})
      : _stonePool = stonePool ?? List.from(StoneType.values);

  @override
  UnmodifiableListView<StoneType> getStonePool() =>
      UnmodifiableListView(_stonePool);

  @override
  void removeStone(StoneType stones) {
    _stonePool.remove(stones);
    notifyListeners();
  }
}
