enum StoneType { balance, standard, crown, hammer, horse, shield, sword }

extension StonesAssetsEnum on StoneType {
  String get getAssetFileName => 'assets/images/$name.png';
}
