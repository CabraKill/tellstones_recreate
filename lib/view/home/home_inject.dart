import 'package:tellstones_recreate/view/home/home_controller.dart';
import 'package:tellstones_recreate/view_models/stone_line_view_model.dart';

HomeController getHomeController(){
  return HomeController(StoneLineViewModelImpl());
}