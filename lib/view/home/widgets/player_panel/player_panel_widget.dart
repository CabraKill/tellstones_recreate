import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/models/callback_type.dart';
import 'package:tellstones_recreate/view/home/widgets/player_panel/action_widget.dart';

class PlayerPanel extends StatefulWidget {
  final CallBack? onFlip;
  final ActionsType? currentAction;
  final void Function(ActionsType)? onTap;
  final bool visible;
  const PlayerPanel({
    required this.currentAction,
    this.onFlip,
    this.onTap,
    Key? key,
    this.visible = true,
  }) : super(key: key);

  @override
  State<PlayerPanel> createState() => _PlayerPanelState();
}

class _PlayerPanelState extends State<PlayerPanel> {
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: widget.visible ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3 * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.brown,
            width: 7,
          ),
          color: Colors.black87,
        ),
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
    );
  }
}
