import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stone_state.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/empty_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/place_stone.dart';
import 'package:tellstones_recreate/view/home/widgets/rotate_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/selected_stone_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widget.dart';

class StoneTargetList extends StatefulWidget {
  final List<StoneState?> stones;
  final bool Function(int index) showTarget;
  final void Function(StoneType stoneType, int index) onAccept;
  final void Function(int index) onTap;
  final void Function(int index)? onLongTap;
  const StoneTargetList({
    required this.stones,
    required this.showTarget,
    required this.onAccept,
    required this.onTap,
    this.onLongTap,
    Key? key,
  }) : super(key: key);

  @override
  State<StoneTargetList> createState() => _StoneTargetListState();
}

class _StoneTargetListState extends State<StoneTargetList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.stones.length,
        (index) => Expanded(
          child: Align(
            alignment: Alignment.center,
            child: widget.stones[index] == null
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
                    onLongPress: () => widget.onLongTap?.call(index),
                    child: Rotate(
                        turned: widget.stones[index]!.turned,
                        child: SelectedStone(
                          key: ValueKey(
                              "stoneTargetListKey_${index}_${widget.stones[index]!.turned}"),
                          isSelected: widget.stones[index]!.selected,
                          child: Stone(
                            type: widget.stones[index]!.type,
                            turned: widget.stones[index]!.turned,
                          ),
                        )),
                  ),
          ),
        ),
      ),
    );
  }
}
