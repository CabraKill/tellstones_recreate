import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

class Stone extends StatelessWidget {
  final StoneType stone;
  const Stone({
    Key? key,
    required this.stone,
  }) : super(key: key);

  static const _stoneHeigth = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _stoneHeigth,
      height: _stoneHeigth,
      child: Image.asset(stone.getAssetFileName),
    );
  }
}
