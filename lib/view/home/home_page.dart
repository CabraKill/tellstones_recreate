import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_target_list.dart';
import 'package:tellstones_recreate/view/home/widgets/the_line_widget.dart';
import 'package:tellstones_recreate/view_models/configuration_view_model.dart';
import 'package:tellstones_recreate/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/view_models/stone_pool_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigurationViewModel>(
        builder: (context, configurationViewModel, child) {
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<StonePoolViewModel>(
                builder: ((context, stonePoolViewModel, child) => StonePool(
                    stones: stonePoolViewModel.stonePool,
                    onDragStarted: () =>
                        configurationViewModel.setIsDragging(true),
                    onDragEnd: () =>
                        configurationViewModel.setIsDragging(false)))),
            Consumer<StoneLineViewModel>(
                builder: (context, stoneLineViewModel, child) {
              return TheLine(
                child: StoneTargetList(
                  showTargets: configurationViewModel.isDragging,
                  stones: stoneLineViewModel.stoneLine,
                  onAccept: stoneLineViewModel.onAccept,
                ),
              );
            }),
          ],
        )),
      );
    });
  }
}
