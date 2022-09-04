import 'package:google_maps_flutter/google_maps_flutter.dart';

class WonderOfWorld {
  String name;
  String iconPath;
  LatLng latLng;
  WonderOfWorld({
    required this.name,
    required this.iconPath,
    required this.latLng,
  });

  @override
  String toString() =>
      'WonderOfWorld(name: $name, iconPath: $iconPath, latLng: $latLng)';

  WonderOfWorld copyWith({
    String? name,
    String? iconPath,
    LatLng? latLng,
  }) {
    return WonderOfWorld(
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      latLng: latLng ?? this.latLng,
    );
  }
}
