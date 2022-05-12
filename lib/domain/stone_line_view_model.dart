import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

abstract class StoneLineViewModel extends ChangeNotifier {
  List<StoneState?> getStoneLine();

  void onPut(StoneType type, int index) {}

  bool canPutStone(int index);

  void flipStone(int index);

  void onSelect(int index);

  List<int> getSelectedStonesIndexList();

  void switchStones();

}
