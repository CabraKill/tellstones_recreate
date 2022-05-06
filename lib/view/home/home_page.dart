import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/domain/is_dragging_view_model.dart';
import 'package:tellstones_recreate/domain/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/stone_pool_view_model.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/view/home/widgets/stone_target_list.dart';
import 'package:tellstones_recreate/view/home/widgets/the_line_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IsDraggingViewModel>(
        builder: (context, configurationViewModel, child) {
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<StonePoolViewModel>(
                builder: ((context, stonePoolViewModel, child) => StonePool(
                    stones: stonePoolViewModel.getStonePool(),
                    onDragStarted: () =>
                        configurationViewModel.setIsDragging(true),
                    onDragEnd: () =>
                        configurationViewModel.setIsDragging(false)))),
            Consumer<StoneLineViewModel>(
                builder: (context, stoneLineViewModel, child) {
              return TheLine(
                child: StoneTargetList(
                  showTarget: (index) =>
                      configurationViewModel.getIsDragging() &&
                      stoneLineViewModel.canPutStone(index),
                  stones: stoneLineViewModel.getStoneLine(),
                  onAccept: (type, index) {
                    stoneLineViewModel.onAccept(type, index);
                    Provider.of<StonePoolViewModel>(context, listen: false)
                        .removeStone(type);
                  },
                ),
              );
            }),
          ],
        )),
      );
    });
  }
}
