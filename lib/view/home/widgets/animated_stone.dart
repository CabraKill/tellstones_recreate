import 'package:flutter/material.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widget.dart';

class AnimatedStone extends StatelessWidget {
  final Stone child;
  const AnimatedStone({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: key,
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => RotationTransition(
        turns: animation,
        child: child,
      ),
      child: child,
    );
  }
}
