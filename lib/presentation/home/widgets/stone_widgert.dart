import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';

class Stone extends StatelessWidget {
  final Stones stone;
  const Stone({
    Key? key,
    required this.stone,
  }) : super(key: key);

  const Stone.none({Key? key}) : this(stone: Stones.none, key: key);

  static const _stoneHeigth = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _stoneHeigth,
      height: _stoneHeigth,
      child: stone == Stones.none
          ? const SizedBox(
              height: _stoneHeigth,
              width: _stoneHeigth,
            )
          : Image.asset(stone.getAssetFileName),
    );
  }
}
