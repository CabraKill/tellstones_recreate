import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneState {
  final StoneType type;
  final bool turned;
  final bool selected;

  StoneState({
    required this.type,
    required this.turned,
    this.selected = false,
  });

  StoneState copyWith({
    final StoneType? type,
    final bool? turned,
    final int? index,
    final bool? selected,
  }) {
    return StoneState(
      type: type ?? this.type,
      turned: turned ?? this.turned,
      selected: selected ?? this.selected,
    );
  }
}
