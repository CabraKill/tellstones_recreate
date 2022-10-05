import 'package:flutter/material.dart';
import 'package:tellstones_recreate/infra/types/on_stone_guess_tap_type.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';
import 'package:tellstones_recreate/view/home/widgets/periodic_animated_builder_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_widget.dart';

class GuessPool extends StatelessWidget {
  final OnStoneGuessTapCallBack onTap;
  const GuessPool({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  static const double _borderWidth = 3;
  static const double _colorOpacityOffset = 0.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: StoneType.values
          .map((type) => PeriodicAnimatedBuilder(
                duration: const Duration(milliseconds: 700),
                builder: (animation) {
                  final curvedAnimation = Curves.ease.transform(animation);

                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: _borderWidth,
                        color: Colors.grey.withOpacity(curvedAnimation),
                      ),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.grey
                            .withOpacity(curvedAnimation * _colorOpacityOffset),
                        BlendMode.srcATop,
                      ),
                      child: Stone(
                        type: type,
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}
