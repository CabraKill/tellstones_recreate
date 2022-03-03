import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';
import 'package:tellstones_recreate/data/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/data/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/presentation/home/widgets/place_stone.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_widgert.dart';
import 'package:tellstones_recreate/presentation/home/widgets/the_line_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDragging = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<StonePoolViewModel>(
              builder: ((context, controller, child) => StonePool(
                  stones: controller.stonePool,
                  onDragStarted: () {
                    setState(() {
                      isDragging = true;
                    });
                  },
                  onDragEnd: () {
                    setState(() {
                      isDragging = false;
                    });
                  }))),
          Consumer<StoneLineViewModel>(builder: (context, controller, child) {
            return TheLine(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (controller.stoneLine.isEmpty && !isDragging)
                    const Stone.none(),
                  // DraggableStone(
                  //     child: Stone(
                  //   stone: Stones.balance,
                  // )),
                  if (isDragging)
                    DragTarget<Stones>(
                      builder: (context, candidateData, rejectedData) =>
                          const PlaceStone(),
                      onAccept: (stoneType) {
                        Provider.of<StoneLineViewModel>(context, listen: false)
                            .addStoneToLeft(stoneType);
                        Provider.of<StonePoolViewModel>(context, listen: false)
                            .removeStone(stoneType);
                      },
                    ),
                  ...controller.stoneLine
                      .map((stone) => Stone(
                            stone: stone.type,
                          ))
                      .toList(),
                  if (isDragging && controller.stoneLine.isNotEmpty)
                    DragTarget<Stones>(
                      builder: (context, candidateData, rejectedData) =>
                          const PlaceStone(),
                      onAccept: (stoneType) {
                        controller.addStoneToRight(stoneType);
                        Provider.of<StonePoolViewModel>(context, listen: false)
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
  }
}
