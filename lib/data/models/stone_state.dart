import 'package:tellstones_recreate/data/models/stones_enum.dart';

class StoneState {
  final Stones type;
  final bool turned;
  final int index;

  StoneState({
    required this.type,
    required this.turned,
    required this.index,
  });
}
