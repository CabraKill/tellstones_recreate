import 'package:tellstones_recreate/domain/view_models/config_points_view_model.dart';

class ConfigPointsViewModelImpl implements ConfigPointsViewModel {
  static const _maxPoints = 3;
  static const _initialPoints = 1;

  @override
  int getMaxPoints() {
    return _maxPoints;
  }

  @override
  int getIntialPoints() {
    return _initialPoints;
  }
}
