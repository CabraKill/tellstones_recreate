enum Stones {
  balance,
  standard,
  crown,
  none
}

extension StonesAssetsEnum on Stones {
  String get getAssetFileName => 'assets/images/$name.png';
}

List<Stones> allStones = [
  Stones.balance,
  Stones.standard,
  Stones.crown,
];
