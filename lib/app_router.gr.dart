// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import 'presentation/current_location/current_location_screen.dart' as _i3;
import 'presentation/home/home_screen.dart' as _i2;
import 'presentation/nearby/nearby_places_screen.dart' as _i4;
import 'presentation/splash/splash_screen.dart' as _i1;
import 'presentation/wonders_of_world/wonders_of_world_screen.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeScreen());
    },
    CurrentLocationScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.CurrentLocationScreen());
    },
    NearbyPlacesScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NearbyPlacesScreen());
    },
    WondersOfWorldScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WondersOfWorldScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreen.name, path: '/'),
        _i6.RouteConfig(HomeScreen.name, path: '/home-screen'),
        _i6.RouteConfig(CurrentLocationScreen.name,
            path: '/current-location-screen'),
        _i6.RouteConfig(NearbyPlacesScreen.name, path: '/nearby-places-screen'),
        _i6.RouteConfig(WondersOfWorldScreen.name,
            path: '/wonders-of-world-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i6.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i6.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/home-screen');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.CurrentLocationScreen]
class CurrentLocationScreen extends _i6.PageRouteInfo<void> {
  const CurrentLocationScreen()
      : super(CurrentLocationScreen.name, path: '/current-location-screen');

  static const String name = 'CurrentLocationScreen';
}

/// generated route for
/// [_i4.NearbyPlacesScreen]
class NearbyPlacesScreen extends _i6.PageRouteInfo<void> {
  const NearbyPlacesScreen()
      : super(NearbyPlacesScreen.name, path: '/nearby-places-screen');

  static const String name = 'NearbyPlacesScreen';
}

/// generated route for
/// [_i5.WondersOfWorldScreen]
class WondersOfWorldScreen extends _i6.PageRouteInfo<void> {
  const WondersOfWorldScreen()
      : super(WondersOfWorldScreen.name, path: '/wonders-of-world-screen');

  static const String name = 'WondersOfWorldScreen';
}
