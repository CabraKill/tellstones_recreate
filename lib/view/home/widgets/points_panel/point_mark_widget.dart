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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PointMark.pointMarkSize,
      height: PointMark.pointMarkSize,
      child: Transform.rotate(
        angle: -pi / 4,
        child: Container(
          decoration: BoxDecoration(
              color: isOutlined ? null : _pointColor,
              border: Border.all(
                width: 2,
                color: _pointColor,
              )),
          width: pointMarkSize / 2,
          height: pointMarkSize / 2,
        ),
      ),
    );
  }
}
