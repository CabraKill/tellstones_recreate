import 'package:tellstones_recreate/domain/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/home_view_model.dart';
import 'package:tellstones_recreate/domain/stone_line_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class HomeViewModelImpl implements HomeViewModel {
  final StoneLineViewModel stoneLineViewModel;
  final CurrentUsersActionViewModel currentUsersActionViewModel;

  HomeViewModelImpl({
    required this.stoneLineViewModel,
    required this.currentUsersActionViewModel,
  });
  @override
  void onStoneTap(int index) {
    if (currentUsersActionViewModel.getCurrentAction() == ActionsType.flip) {
      flipAction(index);
    } else if (currentUsersActionViewModel.getCurrentAction() ==
        ActionsType.swipe) {
      _selectStone(index);
    }
  }

  @override
  void onStoneLongTap(int index) {
    flipAction(index);
  }

  void flipAction(int index) {
    stoneLineViewModel.flipStone(index);
    currentUsersActionViewModel.switchUser();
  }

  void _selectStone(int index) {
    final stone = stoneLineViewModel.getStoneLine()[index];
    if ((stone?.selected ?? false) ||
        stoneLineViewModel.getSelectedStonesIndexList().length <= 1) {
      stoneLineViewModel.onSelect(index);
    }
  }

  @override
  bool readyToSwith(ActionsType? currentAction, int selectedStonesLength) {
    return currentAction == ActionsType.swipe && selectedStonesLength == 2;
  }

  @override
  List<int> getSelectedStonesIndexList() {
    return stoneLineViewModel.getSelectedStonesIndexList();
  }

  @override
  void onSwitch() {
    stoneLineViewModel.switchStones();
    currentUsersActionViewModel.switchUser();
  }
}
