import 'package:flutter/material.dart';

class SelectedStone extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  const SelectedStone({
    Key? key,
    required this.child,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeOut,
      crossFadeState:
          isSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: child,
      secondChild: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.blue.withOpacity(0.5),
          BlendMode.srcATop,
        ),
        child: child,
      ),
    );
  }
}
