import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

class ActionChallenge extends StatelessWidget {
  final ActionsType? type;
  final double size;
  const ActionChallenge({
    required this.type,
    this.size = _defaultSize,
    Key? key,
  }) : super(key: key);

  static const _defaultSize = 40.0;

  @override
  Widget build(BuildContext context) {
    final safeType = type;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: safeType == null
          ? SizedBox.square(
              dimension: size,
            )
          : Icon(
              safeType.icon,
              color: Colors.blue,
              size: size,
              key: ValueKey('actionChanlengeKey${type.toString()}'),
            ),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
