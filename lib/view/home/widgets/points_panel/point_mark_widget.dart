import 'dart:math';
import 'package:flutter/material.dart';

class PointMark extends StatelessWidget {
  final bool isOutlined;
  const PointMark({Key? key})
      : isOutlined = false,
        super(key: key);
  const PointMark.outlined({Key? key})
      : isOutlined = true,
        super(key: key);
  static const pointMarkSize = 10.0;
  static const _pointColor = Colors.blue;
  static const double _borderWidth = 2;
  static const double _widthFactor = 0.5;
  static const _angle = -pi / 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PointMark.pointMarkSize,
      height: PointMark.pointMarkSize,
      child: Transform.rotate(
        angle: _angle,
        child: Container(
          decoration: BoxDecoration(
            color: isOutlined ? null : _pointColor,
            border: Border.all(
              width: _borderWidth,
              color: _pointColor,
            ),
          ),
          width: pointMarkSize * _widthFactor,
          height: pointMarkSize * _widthFactor,
        ),
      ),
    );
  }
}
