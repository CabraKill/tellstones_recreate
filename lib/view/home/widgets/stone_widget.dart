import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/constants/stone_constants.dart';

class Stone extends StatelessWidget {
  final StoneType type;
  final bool turned;
  const Stone({
    Key? key,
    required this.type,
    this.turned = false,
  }) : super(key: key);

  static const _stoneHeigth = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _stoneHeigth,
      height: _stoneHeigth,
      child: !turned
          ? Image.asset(type.getAssetFileName)
          : Image.asset(StoneConstants.backAsset),
    );
  }
}
