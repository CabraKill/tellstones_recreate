import 'package:flutter/material.dart';

enum ActionsType {
  put,
  swipe,
  flip,
  //TODO: add challenge
  iKnowAllPieces,
}

extension ActionstypeExtension on ActionsType {
  IconData get icon {
    switch (this) {
      case ActionsType.put:
        return Icons.swipe;
      case ActionsType.swipe:
        return Icons.swap_horiz;
      case ActionsType.flip:
        return Icons.flip;
      case ActionsType.iKnowAllPieces:
        return Icons.check;
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
      case ActionsType.iKnowAllPieces:
        return 'I know all pieces';
    }
  }
}
