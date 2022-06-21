import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

abstract class HomeViewModel {
  void onStoneTap(int index);
  void onStoneLongTap(int index);
  List<int> getSelectedStonesIndexList();
  bool readyToSwith(ActionsType? currentAction, int selectedStonesLength);
  void onSwitch();
  void onChallengeTap(StoneType type);
}
