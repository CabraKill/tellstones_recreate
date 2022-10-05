import 'package:flutter/material.dart';
import 'package:tellstones_recreate/infra/types/animation_builder_type.dart';

class PeriodicAnimatedBuilder extends StatefulWidget {
  final Duration duration;
  final AnimationBuilder builder;
  const PeriodicAnimatedBuilder({
    required this.builder,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  State<PeriodicAnimatedBuilder> createState() =>
      _PeriodicAnimatedBuilderState();
}

class _PeriodicAnimatedBuilderState extends State<PeriodicAnimatedBuilder>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController.repeat(reverse: true);
  }

  late final animationController =
      AnimationController(vsync: this, duration: widget.duration);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return widget.builder(animationController.value);
      },
    );
  }
}
