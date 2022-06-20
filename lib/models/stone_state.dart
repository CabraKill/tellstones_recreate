import 'package:tellstones_recreate/models/stones_enum.dart';

class StoneState {
  final StoneType type;
  final bool turned;
  final bool isSelectedForSwipe;
  final bool isSelectedForChallenge;

  StoneState({
    required this.type,
    required this.turned,
    this.isSelectedForSwipe = false,
    this.isSelectedForChallenge = false,
  });

  StoneState copyWith({
    final StoneType? type,
    final bool? turned,
    final int? index,
    final bool? isSelectedForSwipe,
    final bool? isSelectedForChallenge,
  }) {
    return StoneState(
      type: type ?? this.type,
      turned: turned ?? this.turned,
      isSelectedForSwipe: isSelectedForSwipe ?? this.isSelectedForSwipe,
      isSelectedForChallenge:
          isSelectedForChallenge ?? this.isSelectedForChallenge,
    );
  }
}
