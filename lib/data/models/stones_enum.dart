enum Stones { balance, standard, crown, hammer, horse, shield, sword }

extension StonesAssetsEnum on Stones {
  String get getAssetFileName => 'assets/images/$name.png';
}
