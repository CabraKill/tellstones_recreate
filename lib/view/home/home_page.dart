import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/domain/view_models/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/home_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/is_dragging_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_pool_view_model.dart';
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Consumer<IsDraggingViewModel>(
        builder: (context, configurationViewModel, child) {
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
                          quarterTurns: 2,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Consumer<StoneLineViewModel>(
                                builder: (context, stoneLineViewModel, child) {
                              return Consumer<CurrentUsersActionViewModel>(
                                  builder: (context,
                                      currentUsersActionViewModel, child) {
                                return PlayerPanel(
                                  visible: currentUsersActionViewModel
                                      .getIsUser2Turn(),
                                  currentAction: currentUsersActionViewModel
                                      .getCurrentAction(),
                                  onTap: currentUsersActionViewModel
                                      .setCurrentAction,
                                  onInvisible: (context) => ActionChallenge(
                                      type: currentUsersActionViewModel
                                          .getCurrentAction()),
                                  isReadyToSwitch: Provider.of<HomeViewModel>(
                                          context,
                                          listen: false)
                                      .readyToSwith(
                                          currentUsersActionViewModel
                                              .getCurrentAction(),
                                          stoneLineViewModel
                                              .getSelectedStonesForSwipeIndexList()
                                              .length),
                                  onConfirmSwitch: Provider.of<HomeViewModel>(
                                          context,
                                          listen: false)
                                      .onSwitch,
                                );
                              });
                            }),
                          )),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Consumer<StoneLineViewModel>(
                            builder: (context, stoneLineViewModel, child) {
                          return Consumer<CurrentUsersActionViewModel>(
                            builder:
                                (context, currentUsersActionViewModel, child) {
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
                                  isReadyToSwitch: Provider.of<HomeViewModel>(
                                          context,
                                          listen: false)
                                      .readyToSwith(
                                    currentUsersActionViewModel
                                        .getCurrentAction(),
                                    stoneLineViewModel
                                        .getSelectedStonesForSwipeIndexList()
                                        .length,
                                  ),
                                  onConfirmSwitch: Provider.of<HomeViewModel>(
                                          context,
                                          listen: false)
                                      .onSwitch);
                            },
                          );
                        }),
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
                    Consumer<CurrentUsersActionViewModel>(
                        builder: (context, currentUsersActionViewModel, child) {
                      return AnimateGuessPool(
                        child: currentUsersActionViewModel.getCurrentAction() ==
                                ActionsType.challenge
                            ? Consumer<StoneLineViewModel>(
                                builder: (context, stoneLineViewModel, child) {
                                return GuessPool(
                                  onTap: (type) {
                                    if (stoneLineViewModel
                                        .isAnyStoneSeletecForChallenge()) {
                                      Provider.of<HomeViewModel>(context,
                                              listen: false)
                                          .onChallengeTap(type);
                                    }
                                  },
                                );
                              })
                            : Consumer<StonePoolViewModel>(
                                builder: ((context, stonePoolViewModel,
                                        child) =>
                                    StonePool(
                                      stones: stonePoolViewModel.getStonePool(),
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
                          onTap:
                              Provider.of<HomeViewModel>(context, listen: false)
                                  .onStoneTap,
                          onLongTap:
                              Provider.of<HomeViewModel>(context, listen: false)
                                  .onStoneLongTap,
                        ));
                      }),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Transform.rotate(
                  angle: pi,
                  child: const PointsPanel(
                    //TODO: call new view model here
                    currentPoints: 3,
                    maxPoints: 3,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                //TODO: call new view model here
                child: PointsPanel(
                  currentPoints: 2,
                  maxPoints: 3,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
