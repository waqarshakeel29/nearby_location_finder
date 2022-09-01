import 'package:location/location.dart';

import '../domain/app_location.dart';

class AppLocationHelper {
  static Future<bool> isLocationServiceAvailable() async {
    bool serviceEnabled = await Location().serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Location().requestService();
      if (!serviceEnabled) {
        return false;
      }
    }
    return true;
  }

  static Future<bool> checkAndAskForLocationPermission() async {
    PermissionStatus permissionGranted = await Location().hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Location().requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  static Future<AppLocation?> _userLocation() async {
    try {
      // 1. check if the location service, can be off in case of location
      // feature is off, the user can be requested to turn on the location
      // feature
      if (!await isLocationServiceAvailable()) {
        return null;
      }

      // 2. Permission request
      if (!await checkAndAskForLocationPermission()) {
        return null;
      }

      final sensorLocation = await Location().getLocation();

      // /// 3. In case the location sensor in faulty/OS issue, the location values
      // /// can be null
      if (sensorLocation.latitude == null || sensorLocation.longitude == null) {
        return null;
      }

      return AppLocation(sensorLocation.latitude!, sensorLocation.longitude!);
    } catch (e) {
      return null;
    }
  }

  static Future<AppLocation?> getUserLocation() async {
    return await _userLocation().timeout(
      const Duration(seconds: 5),
      // TODO: document
      onTimeout: () async {
        return await _userLocation();
      },
    );
  }
}
