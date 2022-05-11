import 'package:flutter/material.dart';

class SelectedStoneA extends StatelessWidget {
  final List<int> selectecStonesIndexList;
  final Widget child;
  const SelectedStoneA({
    required this.selectecStonesIndexList,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                7,
                (index) => Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: selectecStonesIndexList.contains(index)
                              ? const Icon(Icons.keyboard_arrow_down_sharp)
                              : const SizedBox.shrink()),
                    )),
          ),
        ),
        Expanded(child: child),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              7,
              (index) => selectecStonesIndexList.contains(index)
                  ? const Icon(Icons.arrow_downward)
                  : const SizedBox.shrink()),
        ),
      ],
    );
  }
}
