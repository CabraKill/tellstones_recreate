import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/animated_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/empty_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/place_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widgert.dart';

class StoneTargetList extends StatefulWidget {
  final List<StoneState?> stones;
  final bool Function(int index) showTarget;
  final void Function(StoneType stoneType, int index) onAccept;
  final void Function(int index) onTap;
  const StoneTargetList({
    required this.stones,
    required this.showTarget,
    required this.onAccept,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<StoneTargetList> createState() => _StoneTargetListState();
}

class _StoneTargetListState extends State<StoneTargetList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          widget.stones.length,
          (index) => widget.stones[index] == null
              ? widget.showTarget(index)
                  ? DragTarget<StoneType>(
                      builder: (context, candidateData, rejectedData) =>
                          const PlaceStone(),
                      onAccept: (stoneType) =>
                          widget.onAccept(stoneType, index),
                    )
                  : const EmptyStone()
              : InkWell(
                  onTap: () => widget.onTap(index),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeIn.flipped,
                    transitionBuilder: (child, animation) {
                      final rotateAnim =
                          Tween(begin: pi, end: 0.0).animate(animation);
                      return AnimatedBuilder(
                        animation: rotateAnim,
                        builder: (context, child) {
                          final isUnder = !(child?.key.toString().endsWith(
                                  widget.stones[index]!.turned.toString()) ??
                              false);
                          final value = isUnder
                              ? min(rotateAnim.value, pi / 2)
                              : rotateAnim.value;
                          return Transform(
                            transform: Matrix4.rotationY(value),
                            alignment: Alignment.center,
                            child: child,
                          );
                        },
                        child: child,
                      );
                    },
                    child: Stone(
                      key: ValueKey(
                          "stoneTargetListKey_${index}_${widget.stones[index]!.turned}"),
                      type: widget.stones[index]!.type,
                      turned: widget.stones[index]!.turned,
                    ),
                    layoutBuilder: (widget, list) =>
                        Stack(children: [widget!, ...list]),
                  ),
                )),
    );
  }
}
