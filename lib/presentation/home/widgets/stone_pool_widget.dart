import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_widgert.dart';

class StonePool extends StatelessWidget {
  final List<Stones> stones;
  const StonePool({Key? key, required this.stones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stones.map((stone) => Stone(stone: stone)).toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
