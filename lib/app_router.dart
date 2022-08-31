import 'package:auto_route/auto_route.dart';
import 'package:nearby_location_finder/presentation/home/home_screen.dart';
import 'package:nearby_location_finder/presentation/splash/splash_screen.dart';

// part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen)
  ],
)
class $AppRouter {}
