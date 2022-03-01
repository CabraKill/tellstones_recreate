import 'dart:ui';

import 'package:flutter/material.dart';

class DraggableStone extends StatelessWidget {
  final Widget child;
  const DraggableStone({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: child,
      feedback: child,
      childWhenDragging: Text('')
      // ImageFiltered(
      //   child: child,
      //   imageFilter: ImageFilter.blur(),
      // ),
    );
  }
}
