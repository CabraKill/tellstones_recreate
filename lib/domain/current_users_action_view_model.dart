import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

abstract class CurrentUsersActionViewModel extends ChangeNotifier {
  ActionsType? getCurrentActionUser1();
  void setCurrentActionUser1(ActionsType action);

  ActionsType? getCurrentActionUser2();
  void setCurrentActionUser2(ActionsType action);

  bool getIsUser1Turn();
  bool getIsUser2Turn();

  void switchUser();
  void setIsUser1Turn(bool isUser1Turn);
  void setIsUser2Turn(bool isUser2Turn);
}
