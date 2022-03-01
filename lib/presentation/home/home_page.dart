import 'package:flutter/material.dart';
import 'package:tellstones_recreate/data/models/stones_enum.dart';
import 'package:tellstones_recreate/presentation/home/widgets/draggable_stone_widget.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_pool_widget.dart';
import 'package:tellstones_recreate/presentation/home/widgets/stone_widgert.dart';
import 'package:tellstones_recreate/presentation/home/widgets/the_line_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
            child: StonePool(stones: [
              Stones.standard,
              Stones.balance,
              Stones.crown,
            ]),
          ),
          TheLine(
            child: Row(
              children: const [
                DraggableStone(
                    child: Stone(
                  stone: Stones.balance,
                )),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      )),
    );
  }
}
