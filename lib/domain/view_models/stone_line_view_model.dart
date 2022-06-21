import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

abstract class StoneLineViewModel extends ChangeNotifier {
  List<StoneState?> getStoneLine();

  void onPut(StoneType type, int index) {}

  bool canPutStone(int index);

  void flipStone(int index);

  void onSelectForSwipe(int index);

  void onSelectForChallenge(int index);

  List<int> getSelectedStonesForSwipeIndexList();
  bool isAnyStoneSeletecForChallenge();
  StoneType? getCurrentStoneTypeForChallenge();

  void switchStones();
}
