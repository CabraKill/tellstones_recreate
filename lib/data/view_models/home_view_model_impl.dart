import 'package:tellstones_recreate/domain/view_models/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/home_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/table_points_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

class HomeViewModelImpl implements HomeViewModel {
  final StoneLineViewModel _stoneLineViewModel;
  final CurrentUsersActionViewModel _currentUsersActionViewModel;
  final TablePointsViewModel _tablePointsViewModel;

  static const _necessaryAmountOfSelectedStones = 2;

  HomeViewModelImpl({
    required StoneLineViewModel stoneLineViewModel,
    required CurrentUsersActionViewModel currentUsersActionViewModel,
    required TablePointsViewModel tablePointsViewModel,
  })  : _stoneLineViewModel = stoneLineViewModel,
        _currentUsersActionViewModel = currentUsersActionViewModel,
        _tablePointsViewModel = tablePointsViewModel;

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
    return currentAction == ActionsType.swipe &&
        selectedStonesLength == _necessaryAmountOfSelectedStones;
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

  @override
  void onChallengeTap(StoneType type) {
    // TODO: clear selected stones and flip the selectec for challenge if upside down.
    final currentStoneTypeForChallenge =
        _stoneLineViewModel.getCurrentStoneTypeForChallenge();
    if (currentStoneTypeForChallenge == type) {
      if (_currentUsersActionViewModel.getIsUser1Turn()) {
        _tablePointsViewModel.addPlayerTwoPoints(1);
      } else {
        _tablePointsViewModel.addPlayerOnePoints(1);
      }
    } else {
      if (_currentUsersActionViewModel.getIsUser1Turn()) {
        _tablePointsViewModel.addPlayerOnePoints(1);
      } else {
        _tablePointsViewModel.addPlayerTwoPoints(1);
      }
    }
    _currentUsersActionViewModel.switchUser();

    //TODO analyse the win
    //TODO remove red color
  }
}
