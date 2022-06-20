import 'package:tellstones_recreate/domain/view_models/config_points_view_model.dart';

class ConfigPointsViewModelImpl implements ConfigPointsViewModel {
  @override
  int getMaxPoints() {
    return 3;
  }

  @override
  int getIntialPoints() {
    return 1;
  }
}
