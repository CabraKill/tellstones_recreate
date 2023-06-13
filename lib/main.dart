import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/data/view_models/current_users_action_view_model_impl.dart';
import 'package:tellstones_recreate/data/view_models/home_view_model_impl.dart';
import 'package:tellstones_recreate/data/view_models/is_dragging_view_model_impl.dart';
import 'package:tellstones_recreate/data/view_models/points_view_model_impl.dart';
import 'package:tellstones_recreate/data/view_models/stone_line_view_model_impl.dart';
import 'package:tellstones_recreate/data/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/data/view_models/table_points_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/config_points_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/home_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/is_dragging_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/domain/view_models/table_points_view_model.dart';
import 'package:tellstones_recreate/view/home/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<StonePoolViewModel>(
        create: (context) => StonePoolViewModelImpl(),
      ),
      ChangeNotifierProvider<StoneLineViewModel>(
        create: (context) => StoneLineViewModelImpl(),
      ),
      ChangeNotifierProvider<TablePointsViewModel>(
        create: (context) => TablePointsViewModelImpl(),
      ),
      ChangeNotifierProvider<IsDraggingViewModel>(
        create: (context) => IsDraggingViewModelImpl(),
      ),
      ChangeNotifierProvider<CurrentUsersActionViewModel>(
        create: (context) => CurrentUsersActionViewModelImpl(),
      ),
      Provider<ConfigPointsViewModel>(
        create: (context) => ConfigPointsViewModelImpl(),
      ),
      Provider<HomeViewModel>(
        create: (context) => HomeViewModelImpl(
          currentUsersActionViewModel:
              Provider.of<CurrentUsersActionViewModel>(context, listen: false),
          stoneLineViewModel:
              Provider.of<StoneLineViewModel>(context, listen: false),
          tablePointsViewModel:
              Provider.of<TablePointsViewModel>(context, listen: false),
        ),
      ),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    ),
  ));
}
