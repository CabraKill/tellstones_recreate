enum Stones {
  balance,
  standard,
  crown,
}

extension StonesAssetsEnum on Stones {
  String get getAssetFileName => 'assets/images/$name.png';
}
