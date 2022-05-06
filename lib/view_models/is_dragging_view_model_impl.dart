import 'package:flutter/cupertino.dart';
import 'package:tellstones_recreate/domain/is_dragging_view_model.dart';

class IsDraggingViewModelImpl extends ChangeNotifier
    implements IsDraggingViewModel {
  bool _isDragging = false;

  @override
  bool getIsDragging() => _isDragging;

  @override
  void setIsDragging(bool isDragging) {
    _isDragging = isDragging;
    notifyListeners();
  }
}
