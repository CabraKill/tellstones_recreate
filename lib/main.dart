import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tellstones_recreate/view/home/home_page.dart';
import 'package:tellstones_recreate/view_models/configuration_view_model.dart';
import 'package:tellstones_recreate/view_models/stone_line_view_model.dart';
import 'package:tellstones_recreate/view_models/stone_pool_view_model.dart';
import 'package:tellstones_recreate/view_models/table_points_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Provider(
      //   create: (context) => getHomeController(),
      // ),
      ChangeNotifierProvider(create: (context) => StonePoolViewModel()),
      ChangeNotifierProvider(create: (context) => StoneLineViewModel()),
      ChangeNotifierProvider(create: (context) => TablePointsViewModel()),
      ChangeNotifierProvider(create: (context) => ConfigurationViewModel()),
    ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    ),
  ));
}
