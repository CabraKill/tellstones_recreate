import 'package:tellstones_recreate/data/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/presentation/home/home_controller.dart';

HomeController getHomeController(){
  return HomeController(StoneLineViewModel());
}