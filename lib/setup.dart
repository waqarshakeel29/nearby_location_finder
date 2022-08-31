import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_location_finder/app_router.gr.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<AppRouter>(AppRouter());
}
