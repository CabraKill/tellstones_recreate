import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tellstones_recreate/utils/calculate_between_align_util.dart';
import 'package:tellstones_recreate/view/home/widgets/points_panel/point_mark_widget.dart';

class PointsPanel extends StatelessWidget {
  final int currentPoints;
  final int maxPoints;
  final bool rotate;
  const PointsPanel({
    required this.currentPoints,
    required this.maxPoints,
    this.rotate = false,
    Key? key,
  }) : super(key: key);

  static const _verticalPadding = 12.0;
  @override
  Widget build(BuildContext context) {
    var horizontalPadding = MediaQuery.of(context).size.width * 0.25;

    final xAlignment = CalculateBetweenAlignUtil.calculateBetweenAlign(
              maxPoints,
              currentPoints,
            ) *
            2 -
        1;

    return Transform.rotate(
      angle: rotate ? pi : 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: _verticalPadding,
        ),
        child: SizedBox(
          width: double.infinity,
          height: PointMark.pointMarkSize,
          child: Stack(
            children: [
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    maxPoints,
                    (index) => const PointMark.outlined(),
                  ),
                ),
              ),
              AnimatedAlign(
                alignment: Alignment(
                  xAlignment,
                  0,
                ),
                duration: const Duration(milliseconds: 300),
                child: const PointMark(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
