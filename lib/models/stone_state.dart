import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneState {
  final StoneType type;
  final bool turned;

  StoneState({
    required this.type,
    required this.turned,
  });

  StoneState copyWith({
    final StoneType? type,
    final bool? turned,
    final int? index,
  }) {
    return StoneState(
      type: type ?? this.type,
      turned: turned ?? this.turned,
    );
  }
}
