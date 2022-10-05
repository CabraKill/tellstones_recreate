import 'package:flutter/material.dart';

class AnimatedSelect extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  final Color? selectedColor;
  const AnimatedSelect({
    Key? key,
    required this.child,
    required this.isSelected,
    this.selectedColor,
  }) : super(key: key);

  static const _colorOpacity = 0.5;
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
          selectedColor ?? Colors.blue.withOpacity(_colorOpacity),
          BlendMode.srcATop,
        ),
        child: child,
      ),
    );
  }
}
