import 'dart:math';

import 'package:flutter/material.dart';

class Flip extends StatelessWidget {
  final bool turned;
  final Widget child;
  const Flip({
    required this.turned,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn.flipped,
      transitionBuilder: (child, animation) {
        final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

        return AnimatedBuilder(
          animation: rotateAnim,
          builder: (context, child) {
            final isUnder =
                !(child?.key.toString().endsWith(turned.toString()) ?? false);
            final value =
                isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;

            return Transform(
              transform: Matrix4.rotationY(value),
              alignment: Alignment.center,
              child: child,
            );
          },
          child: child,
        );
      },
      child: child,
      layoutBuilder: (widget, list) => Stack(children: [
        widget ?? const SizedBox.shrink(),
        ...list,
      ]),
    );
  }
}
