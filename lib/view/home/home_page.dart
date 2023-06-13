import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/domain/view_models/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/home_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/is_dragging_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/table_points_view_model.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/animate_guess_pool_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/guess_pool_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/player_panel/action_challenge.dart';
import 'package:tellstones_recreate/view/home/widgets/player_panel/player_panel_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/points_panel/points_panel_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_target_list.dart';
import 'package:tellstones_recreate/view/home/widgets/the_line_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const _quarterTurns = 2;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Consumer<IsDraggingViewModel>(
      builder: (context, configurationViewModel, child) {
        final homeViewModel =
            Provider.of<HomeViewModel>(context, listen: false);

        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RotatedBox(
                          quarterTurns: _quarterTurns,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Consumer<StoneLineViewModel>(
                              builder: (context, stoneLineViewModel, child) {
                                return Consumer<CurrentUsersActionViewModel>(
                                  builder: (
                                    context,
                                    currentUsersActionViewModel,
                                    child,
                                  ) {
                                    return PlayerPanel(
                                      visible: currentUsersActionViewModel
                                          .getIsUser2Turn(),
                                      currentAction: currentUsersActionViewModel
                                          .getCurrentAction(),
                                      onTap: currentUsersActionViewModel
                                          .setCurrentAction,
                                      onInvisible: (context) => ActionChallenge(
                                        type: currentUsersActionViewModel
                                            .getCurrentAction(),
                                      ),
                                      isReadyToSwitch:
                                          homeViewModel.readyToSwith(
                                        currentUsersActionViewModel
                                            .getCurrentAction(),
                                        stoneLineViewModel
                                            .getSelectedStonesForSwipeIndexList()
                                            .length,
                                      ),
                                      onConfirmSwitch: homeViewModel.onSwitch,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Consumer<StoneLineViewModel>(
                            builder: (context, stoneLineViewModel, child) {
                              return Consumer<CurrentUsersActionViewModel>(
                                builder: (
                                  context,
                                  currentUsersActionViewModel,
                                  child,
                                ) {
                                  return PlayerPanel(
                                    visible: currentUsersActionViewModel
                                        .getIsUser1Turn(),
                                    currentAction: currentUsersActionViewModel
                                        .getCurrentAction(),
                                    onTap: currentUsersActionViewModel
                                        .setCurrentAction,
                                    onInvisible: (context) => ActionChallenge(
                                      type: currentUsersActionViewModel
                                          .getCurrentAction(),
                                    ),
                                    isReadyToSwitch: homeViewModel.readyToSwith(
                                      currentUsersActionViewModel
                                          .getCurrentAction(),
                                      stoneLineViewModel
                                          .getSelectedStonesForSwipeIndexList()
                                          .length,
                                    ),
                                    onConfirmSwitch: homeViewModel.onSwitch,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Consumer<CurrentUsersActionViewModel>(builder:
                          (context, currentUsersActionViewModel, child) {
                        final isChallenging =
                            currentUsersActionViewModel.getCurrentAction() ==
                                ActionsType.challenge;

                        return AnimateGuessPool(
                          child: isChallenging
                              ? Consumer<StoneLineViewModel>(builder:
                                  (context, stoneLineViewModel, child) {
                                  return GuessPool(
                                    onTap: (type) {
                                      if (stoneLineViewModel
                                          .isAnyStoneSeletecForChallenge()) {
                                        homeViewModel.onChallengeTap(type);
                                      }
                                    },
                                  );
                                })
                              : Consumer<StonePoolViewModel>(
                                  builder: ((
                                    context,
                                    stonePoolViewModel,
                                    child,
                                  ) =>
                                      StonePool(
                                        stones:
                                            stonePoolViewModel.getStonePool(),
                                        onDragStarted: () =>
                                            configurationViewModel
                                                .setIsDragging(true),
                                        onDragEnd: () => configurationViewModel
                                            .setIsDragging(false),
                                        enableDrag: currentUsersActionViewModel
                                                .getCurrentAction() ==
                                            ActionsType.put,
                                      )),
                                ),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Consumer<StoneLineViewModel>(
                          builder: (context, stoneLineViewModel, child) {
                            return TheLine(
                              child: StoneTargetList(
                                showTarget: (index) =>
                                    configurationViewModel.getIsDragging() &&
                                    stoneLineViewModel.canPutStone(index),
                                stones: stoneLineViewModel.getStoneLine(),
                                onAccept: (type, index) {
                                  stoneLineViewModel.onPut(type, index);
                                  Provider.of<StonePoolViewModel>(
                                    context,
                                    listen: false,
                                  ).removeStone(type);
                                  Provider.of<CurrentUsersActionViewModel>(
                                    context,
                                    listen: false,
                                  ).switchUser();
                                },
                                onTap: homeViewModel.onStoneTap,
                                onLongTap: homeViewModel.onStoneLongTap,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.rotate(
                    angle: pi,
                    child:  Consumer<TablePointsViewModel>(
                      builder: (context, tablePointsViewModel, child) {
                        return PointsPanel(
                          currentPoints: tablePointsViewModel.getPlayerTwoPoints().toInt(),
                          maxPoints: 3,
                        );
                      },
                    ),
                  ),
                ),
                 Align(
                  alignment: Alignment.bottomCenter,
                  // TODO: call new view model here.
                  child: Consumer<TablePointsViewModel>(
                    builder: (context, tablePointsViewModel, child) {
                      return PointsPanel(
                        currentPoints: tablePointsViewModel.getPlayerOnePoints().toInt(),
                        maxPoints: 3,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
