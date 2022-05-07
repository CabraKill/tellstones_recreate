import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class ActionChallenge extends StatelessWidget {
  final ActionsType? type;
  final double size;
  const ActionChallenge({
    required this.type,
    this.size = 40,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: type != null
          ? Icon(
              type!.icon,
              color: Colors.blue,
              size: size,
              key: ValueKey('actionChanlengeKey${type.toString()}'),
            )
          : SizedBox.square(
              dimension: size,
            ),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
