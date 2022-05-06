import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/domain/current_users_action_view_model.dart';
import 'package:tellstones_recreate/domain/is_dragging_view_model.dart';
import 'package:tellstones_recreate/domain/config_points_view_model.dart';
import 'package:tellstones_recreate/domain/stone_line_view_model.dart';
import 'package:tellstones_recreate/domain/stone_pool_view_model.dart';
import 'package:tellstones_recreate/domain/table_points_view_model.dart';
import 'package:tellstones_recreate/view/home/home_page.dart';
import 'package:tellstones_recreate/view_models/current_users_action_view_model_impl.dart';
import 'package:tellstones_recreate/view_models/is_dragging_view_model_impl.dart';
import 'package:tellstones_recreate/view_models/points_view_model_impl.dart';
import 'package:tellstones_recreate/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/view_models/table_points_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<StonePoolViewModel>(
          create: (context) => StonePoolViewModelImpl()),
      ChangeNotifierProvider<StoneLineViewModel>(
          create: (context) => StoneLineViewModelImpl()),
      ChangeNotifierProvider<TablePointsViewModel>(
          create: (context) => TablePointsViewModelImpl()),
      ChangeNotifierProvider<IsDraggingViewModel>(
          create: (context) => IsDraggingViewModelImpl()),
      ChangeNotifierProvider<CurrentUsersActionViewModel>(
          create: (context) => CurrentUsersActionViewModelImpl()),
      Provider<ConfigPointsViewModel>(
        create: (context) => ConfigPointsViewModelImpl(),
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
