import 'package:flutter/material.dart';

class AnimateGuessPool extends StatelessWidget {
  final Widget child;
  const AnimateGuessPool({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
