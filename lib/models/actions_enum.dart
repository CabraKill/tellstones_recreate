import 'package:flutter/material.dart';

enum ActionsType {
  put,
  swipe,
  flip,
  challenge,
  iKnowAllPieces,
}

extension ActionstypeExtension on ActionsType {
  IconData get icon {
    switch (this) {
      case ActionsType.put:
        return Icons.add_circle;
      case ActionsType.swipe:
        return Icons.swipe;
      case ActionsType.flip:
        return Icons.flip;
      case ActionsType.challenge:
        return Icons.question_mark;
      case ActionsType.iKnowAllPieces:
        return Icons.star;
    }
  }

  String get description {
    switch (this) {
      case ActionsType.put:
        return 'Put';
      case ActionsType.swipe:
        return 'Switch';
      case ActionsType.flip:
        return 'Flip';
      case ActionsType.challenge:
        return 'Challenge';
      case ActionsType.iKnowAllPieces:
        return 'I know all pieces';
    }
  }
}
