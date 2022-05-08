import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/domain/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/home_view_model.dart';
import 'package:tellstones_recreate/domain/stone_line_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class HomeViewModelImpl extends ChangeNotifier implements HomeViewModel {
  final StoneLineViewModel stoneLineViewModel;
  final CurrentUsersActionViewModel currentUsersActionViewModel;

  HomeViewModelImpl({
    required this.stoneLineViewModel,
    required this.currentUsersActionViewModel,
  });
  @override
  void onStoneTap(int index) {
    if (currentUsersActionViewModel.getCurrentActionUser1() ==
            ActionsType.flip ||
        currentUsersActionViewModel.getCurrentActionUser2() ==
            ActionsType.flip) {
      stoneLineViewModel.flipStone(index);
      currentUsersActionViewModel.switchUser();
    }
  }
}
