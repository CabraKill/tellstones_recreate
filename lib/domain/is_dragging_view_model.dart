import 'package:flutter/cupertino.dart';

abstract class IsDraggingViewModel extends ChangeNotifier{
  bool getIsDragging();

  void setIsDragging(bool isDragging);
}
