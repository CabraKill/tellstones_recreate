import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';
import 'package:tellstones_recreate/infra/types/callback_type.dart';

class ActionButton extends StatelessWidget {
  final ActionsType actionType;
  final CallBack? onTap;
  final bool activated;
  const ActionButton({
    required this.actionType,
    required this.activated,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState:
            activated ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: Icon(
          actionType.icon,
          color: Colors.white,
        ),
        secondChild: Icon(
          actionType.icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
