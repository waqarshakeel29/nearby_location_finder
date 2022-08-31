import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_location_finder/setup.dart';

import 'app_router.gr.dart';

void main() async {
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: GetIt.I<AppRouter>().delegate(),
      routeInformationParser: GetIt.I<AppRouter>().defaultRouteParser(),
    );
  }
}
