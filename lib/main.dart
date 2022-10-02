import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_location_finder/controller/theme_controller.dart';
import 'package:nearby_location_finder/setup.dart';
import 'package:provider/provider.dart';

import 'app_router.gr.dart';

void main() async {
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = GetIt.instance<ThemeController>();
    return ChangeNotifierProvider<ThemeController>(
      create: (context) => themeController,
      child: Consumer<ThemeController>(builder: (context, theme, child) {
        return MaterialApp.router(
          routerDelegate: GetIt.I<AppRouter>().delegate(),
          routeInformationParser: GetIt.I<AppRouter>().defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          // theme: themeController.getTheme(),
          // themeMode: theme.themeMode,
        );
      }),
    );
  }
}
