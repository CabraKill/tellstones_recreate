import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/models/callback_type.dart';
import 'package:tellstones_recreate/utils/colors.dart';
import 'package:tellstones_recreate/view/home/widgets/player_panel/action_widget.dart';

class PlayerPanel extends StatefulWidget {
  final CallBack? onFlip;
  final ActionsType? currentAction;
  final void Function(ActionsType)? onTap;
  final bool visible;
  final Widget Function(BuildContext)? onInvisible;
  final bool? isReadyToSwitch;
  final CallBack? onConfirmSwitch;

  const PlayerPanel({
    required this.currentAction,
    required this.isReadyToSwitch,
    this.onConfirmSwitch,
    this.onFlip,
    this.onTap,
    Key? key,
    this.visible = true,
    this.onInvisible,
  }) : super(key: key);

  @override
  State<PlayerPanel> createState() => _PlayerPanelState();
}

class _PlayerPanelState extends State<PlayerPanel> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: widget.visible
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              width: widget.isReadyToSwitch ?? false
                  ? MediaQuery.of(context).size.width * 0.1
                  : MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                  color: AppColors.lightBlue,
                  width: 7,
                ),
                color: Colors.black87,
              ),
              alignment: Alignment.center,
              child: AnimatedCrossFade(
                  crossFadeState: widget.isReadyToSwitch ?? false
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  firstChild: FittedBox(
                    fit: BoxFit.none,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.from(ActionsType.values)
                              .map((action) => ActionButton(
                                    actionType: action,
                                    activated: widget.currentAction == action,
                                    onTap: () => widget.onTap?.call(action),
                                  ))
                              .toList()),
                    ),
                  ),
                  secondChild: InkWell(
                    onTap: widget.onConfirmSwitch,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )),
            )
          : widget.onInvisible?.call(context) ?? const SizedBox.shrink(),
    );
  }
}
