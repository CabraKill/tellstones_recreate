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
      color: AppColors.darkBlue,
      padding: const EdgeInsets.all(8),
      child: Container(
      padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          color: AppColors.darkBlue,
        ),
        child: child,
      ),
    );
  }
}
