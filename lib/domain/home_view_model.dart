import 'package:tellstones_recreate/models/actions_enum.dart';

abstract class HomeViewModel {
  void onStoneTap(int index);
  void onStoneLongTap(int index);
  List<int> getSelectedStonesIndexList();
  bool readyToSwith(ActionsType currentAction, int selectedStonesLength);
}
