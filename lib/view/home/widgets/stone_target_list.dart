import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/empty_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/place_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widgert.dart';

class StoneTargetList extends StatefulWidget {
  final List<StoneState?> stones;
  final bool Function(int index) showTarget;
  final void Function(StoneType stoneType, int index) onAccept;
  const StoneTargetList({
    required this.stones,
    required this.showTarget,
    required this.onAccept,
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
                      onAccept: (stoneType) => widget.onAccept(stoneType, index),
                    )
                  : const EmptyStone()
              : Stone(
                  stone: widget.stones[index]!.type,
                )),
    );
  }
}
