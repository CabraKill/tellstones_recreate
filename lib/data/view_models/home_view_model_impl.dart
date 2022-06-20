import 'package:tellstones_recreate/domain/view_models/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/home_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class HomeViewModelImpl implements HomeViewModel {
  final StoneLineViewModel _stoneLineViewModel;
  final CurrentUsersActionViewModel _currentUsersActionViewModel;

  HomeViewModelImpl({
    required StoneLineViewModel stoneLineViewModel,
    required CurrentUsersActionViewModel currentUsersActionViewModel,
  })  : _stoneLineViewModel = stoneLineViewModel,
        _currentUsersActionViewModel = currentUsersActionViewModel;
  @override
  void onStoneTap(int index) {
    var currentAction = _currentUsersActionViewModel.getCurrentAction();
    if (currentAction == null) return;
    switch (currentAction) {
      case ActionsType.flip:
        flipAction(index);
        break;
      case ActionsType.swipe:
        _selectStoneForSwipe(index);
        break;
      case ActionsType.challenge:
        _selectStoneForChallenge(index);
        break;
      default:
    }
  }

  @override
  void onStoneLongTap(int index) {
    flipAction(index);
  }

  void flipAction(int index) {
    _stoneLineViewModel.flipStone(index);
    _currentUsersActionViewModel.switchUser();
  }

  void _selectStoneForSwipe(int index) {
    final stone = _stoneLineViewModel.getStoneLine()[index];
    if ((stone?.isSelectedForSwipe ?? false) ||
        _stoneLineViewModel.getSelectedStonesForSwipeIndexList().length <= 1) {
      _stoneLineViewModel.onSelectForSwipe(index);
    }
  }

  void _selectStoneForChallenge(int index) {
    _stoneLineViewModel.onSelectForChallenge(index);
  }

  @override
  bool readyToSwith(ActionsType? currentAction, int selectedStonesLength) {
    return currentAction == ActionsType.swipe && selectedStonesLength == 2;
  }

  @override
  List<int> getSelectedStonesIndexList() {
    return _stoneLineViewModel.getSelectedStonesForSwipeIndexList();
  }

  @override
  void onSwitch() {
    _stoneLineViewModel.switchStones();
    _currentUsersActionViewModel.switchUser();
  }
}
