import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';

class Stone extends StatelessWidget {
  final Stones stone;
  const Stone({
    Key? key,
    required this.stone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(stone.getAssetFileName);
  }
}
