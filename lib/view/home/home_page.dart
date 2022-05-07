import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/domain/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/is_dragging_view_model.dart';
import 'package:tellstones_recreate/domain/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/stone_pool_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/player_panel/action_challenge.dart';
import 'package:tellstones_recreate/view/home/widgets/player_panel/player_panel_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_target_list.dart';
import 'package:tellstones_recreate/view/home/widgets/the_line_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IsDraggingViewModel>(
        builder: (context, configurationViewModel, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
          Expanded(
            child: RotatedBox(
                quarterTurns: 2,
                child: Consumer<CurrentUsersActionViewModel>(
                    builder: (context, currentUsersActionViewModel, child) {
                  return PlayerPanel(
                    visible: currentUsersActionViewModel.getIsUser2Turn(),
                    currentAction:
                        currentUsersActionViewModel.getCurrentActionUser2(),
                    onTap: currentUsersActionViewModel.setCurrentActionUser2,
                    onInvisible: (context) => ActionChallenge(
                        type: currentUsersActionViewModel
                            .getCurrentActionUser1()),
                  );
                })),
          ),
          Expanded(
            child: Consumer<CurrentUsersActionViewModel>(
                builder: (context, currentUsersActionViewModel, child) {
              return Consumer<StonePoolViewModel>(
                  builder: ((context, stonePoolViewModel, child) => StonePool(
                        stones: stonePoolViewModel.getStonePool(),
                        onDragStarted: () =>
                            configurationViewModel.setIsDragging(true),
                        onDragEnd: () =>
                            configurationViewModel.setIsDragging(false),
                        enableDrag: currentUsersActionViewModel
                                    .getCurrentActionUser1() ==
                                ActionsType.put ||
                            currentUsersActionViewModel
                                    .getCurrentActionUser2() ==
                                ActionsType.put,
                      )));
            }),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Consumer<StoneLineViewModel>(
                  builder: (context, stoneLineViewModel, child) {
                return TheLine(
                  child: StoneTargetList(
                    showTarget: (index) =>
                        configurationViewModel.getIsDragging() &&
                        stoneLineViewModel.canPutStone(index),
                    stones: stoneLineViewModel.getStoneLine(),
                    onAccept: (type, index) {
                      stoneLineViewModel.onAccept(type, index);
                      Provider.of<StonePoolViewModel>(
                        context,
                        listen: false,
                      ).removeStone(type);
                      Provider.of<CurrentUsersActionViewModel>(
                        context,
                        listen: false,
                      ).switchUser();
                    },
                  ),
                );
              }),
            ),
          ),
          const Expanded(child: SizedBox()),
          Expanded(
            child: Consumer<CurrentUsersActionViewModel>(
                builder: (context, currentUsersActionViewModel, child) {
              return PlayerPanel(
                visible: currentUsersActionViewModel.getIsUser1Turn(),
                currentAction:
                    currentUsersActionViewModel.getCurrentActionUser1(),
                onTap: currentUsersActionViewModel.setCurrentActionUser1,
                onInvisible: (context) => ActionChallenge(
                    type:
                        currentUsersActionViewModel.getCurrentActionUser2()),
              );
            }),
          ),
            ],
          ),
        ),
      );
    });
  }
}
