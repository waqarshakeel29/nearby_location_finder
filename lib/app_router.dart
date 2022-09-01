import 'package:auto_route/auto_route.dart';
import 'package:nearby_location_finder/presentation/current_location/current_location_screen.dart';
import 'package:nearby_location_finder/presentation/home/home_screen.dart';
import 'package:nearby_location_finder/presentation/nearby/nearby_places_screen.dart';
import 'package:nearby_location_finder/presentation/splash/splash_screen.dart';
import 'package:nearby_location_finder/presentation/wonders_of_world/wonders_of_world_screen.dart';

// part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: CurrentLocationScreen),
    AutoRoute(page: NearbyPlacesScreen),
    AutoRoute(page: WondersOfWorldScreen),
  ],
)
class $AppRouter {}
