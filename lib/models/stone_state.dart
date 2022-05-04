import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneState {
  final StoneType type;
  final bool turned;
  final int index;

  StoneState({
    required this.type,
    required this.turned,
    required this.index,
  });
}
