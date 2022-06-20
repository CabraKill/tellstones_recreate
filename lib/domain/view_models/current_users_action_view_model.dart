import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

abstract class CurrentUsersActionViewModel extends ChangeNotifier {
  ActionsType? getCurrentAction();
  void setCurrentAction(ActionsType action);

  bool getIsUser1Turn();
  bool getIsUser2Turn();

  void switchUser();
  void setIsUser1Turn(bool isUser1Turn);
  void setIsUser2Turn(bool isUser2Turn);
}
