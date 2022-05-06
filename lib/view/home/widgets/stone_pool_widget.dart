import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/callback_type.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/empty_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widgert.dart';

class StonePool extends StatelessWidget {
  final List<StoneType> stones;
  final CallBack? onDragStarted;
  final CallBack? onDragEnd;
  const StonePool({
    Key? key,
    required this.stones,
    this.onDragStarted,
    this.onDragEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return stones.isEmpty
        ? const EmptyStone()
        : Row(
            children: stones
                .map((stone) => Draggable<StoneType>(
                      feedback: Stone(
                        stone: stone,
                      ),
                      child: Stone(stone: stone),
                      childWhenDragging: const EmptyStone(),
                      data: stone,
                      onDragStarted: onDragStarted,
                      onDragEnd: (_) => onDragEnd?.call(),
                    ))
                .toList(),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          );
  }
}
