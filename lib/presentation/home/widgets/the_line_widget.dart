import 'package:flutter/material.dart';
import 'package:tellstones_recreate/utils/colors.dart';

class TheLine extends StatelessWidget {
  final Widget child;
  const TheLine({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.theLineBackground,
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          color: AppColors.theLineBackground,
        ),
        child: child,
      ),
    );
  }
}
