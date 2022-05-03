import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';
import 'package:tellstones_recreate/data/view_models/configuration_view_model.dart';
import 'package:tellstones_recreate/data/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/data/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/presentation/home/widgets/empty_stone.dart';
import 'package:tellstones_recreate/presentation/home/widgets/place_stone.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_widgert.dart';
import 'package:tellstones_recreate/presentation/home/widgets/the_line_widget.dart';

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (stoneLineViewModel.stoneLine.isEmpty &&
                        !configurationViewModel.isDragging)
                      const EmptyStone(),
                    // DraggableStone(
                    //     child: Stone(
                    //   stone: Stones.balance,
                    // )),
                    if (configurationViewModel.isDragging)
                      DragTarget<Stones>(
                        builder: (context, candidateData, rejectedData) =>
                            const PlaceStone(),
                        onAccept: (stoneType) {
                          Provider.of<StoneLineViewModel>(context,
                                  listen: false)
                              .addStoneToLeft(stoneType);
                          Provider.of<StonePoolViewModel>(context,
                                  listen: false)
                              .removeStone(stoneType);
                        },
                      ),
                    ...stoneLineViewModel.stoneLine
                        .map((stone) => Stone(
                              stone: stone.type,
                            ))
                        .toList(),
                    if (configurationViewModel.isDragging &&
                        stoneLineViewModel.stoneLine.isNotEmpty)
                      DragTarget<Stones>(
                        builder: (context, candidateData, rejectedData) =>
                            const PlaceStone(),
                        onAccept: (stoneType) {
                          stoneLineViewModel.addStoneToRight(stoneType);
                          Provider.of<StonePoolViewModel>(context,
                                  listen: false)
                              .removeStone(stoneType);
                        },
                      )
                  ],
                ),
              );
            }),
          ],
        )),
      );
    });
  }
}
