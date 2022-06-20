import 'package:flutter/material.dart';
import 'package:tellstones_recreate/models/stones_enum.dart';

abstract class StonePoolViewModel extends ChangeNotifier {
  List<StoneType> getStonePool();
  void removeStone(StoneType stones);
}
