import 'package:flutter/material.dart';
import 'package:tellstones_recreate/view/constants/stone_constants.dart';

class EmptyStone extends StatelessWidget {
  const EmptyStone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: StoneConstants.size,
      width: StoneConstants.size,
    );
  }
}
