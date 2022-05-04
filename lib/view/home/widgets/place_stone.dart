import 'package:flutter/material.dart';
import 'package:tellstones_recreate/view/constants/stone_constants.dart';

class PlaceStone extends StatelessWidget {
  const PlaceStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: StoneConstants.size,
      width: StoneConstants.size,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
