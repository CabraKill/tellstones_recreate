import 'package:flutter/cupertino.dart';

abstract class TablePointsViewModel extends ChangeNotifier {
  double getPlayerOnePoints();

  double getPlayerTwoPoints();

  void addPlayerOnePoints(double points);

  void addPlayerTwoPoints(double points);

  void resetPoints();

  //TODO add max points
}
