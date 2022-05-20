import 'package:flutter/material.dart';
import 'package:tellstones_recreate/infra/types/callback_type.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/empty_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widget.dart';

class StonePool extends StatelessWidget {
  final List<StoneType> stones;
  final CallBack? onDragStarted;
  final CallBack? onDragEnd;
  final bool enableDrag;
  const StonePool({
    Key? key,
    required this.stones,
    this.onDragStarted,
    this.onDragEnd,
    this.enableDrag = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return stones.isEmpty
        ? const EmptyStone()
        : Row(
            children: stones
                .map((stone) => enableDrag
                    ? Draggable<StoneType>(
                        feedback: Stone(
                          type: stone,
                        ),
                        child: Stone(
                          type: stone,
                        ),
                        childWhenDragging: const EmptyStone(),
                        data: stone,
                        onDragStarted: onDragStarted,
                        onDragEnd: (_) => onDragEnd?.call(),
                      )
                    : Stone(
                        type: stone,
                      ))
                .toList(),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          );
  }
}
