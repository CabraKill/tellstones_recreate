import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_widgert.dart';

class StonePool extends StatelessWidget {
  final List<Stones> stones;
  final void Function()? onDragStarted;
  final void Function()? onDragEnd;
  const StonePool({
    Key? key,
    required this.stones,
    this.onDragStarted,
    this.onDragEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stones
          .map((stone) => Draggable<Stones>(
                feedback: Stone(
                  stone: stone,
                ),
                child: Stone(stone: stone),
                childWhenDragging: const SizedBox.shrink(),
                data: stone,
                onDragStarted: onDragStarted,
                onDragEnd: (_) => onDragEnd?.call(),
              ))
          .toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
