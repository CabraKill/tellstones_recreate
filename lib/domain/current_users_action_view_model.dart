import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/models/actions_enum.dart';

abstract class CurrentUsersActionViewModel extends ChangeNotifier {
  ActionsType? getCurrentActionUser1();
  void setCurrentActionUser1(ActionsType action);

  ActionsType? getCurrentActionUser2();
  void setCurrentActionUser2(ActionsType action);

  int getCurrentUserIndex();
  void setCurrentUserIndex(int index);
}
