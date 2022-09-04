import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_location_finder/domain/nearby_place.dart';
import 'package:nearby_location_finder/domain/wonder_of_world.dart';

class AppConstants {
  static List<NearByPlace> nearByPlacesList = [
    NearByPlace(name: 'ATM', iconPath: 'assets/icons/atm.png'),
    NearByPlace(name: 'Airport', iconPath: 'assets/icons/airport.png'),
    NearByPlace(name: 'Bank', iconPath: 'assets/icons/bank.png'),
    NearByPlace(
        name: 'Beauty Salon', iconPath: 'assets/icons/beauty_saloon.png'),
    NearByPlace(name: 'Bus Station', iconPath: 'assets/icons/bus.png'),
    NearByPlace(name: 'Cafe', iconPath: 'assets/icons/cafe.png'),
    NearByPlace(name: 'Dentist', iconPath: 'assets/icons/dentist.png'),
    NearByPlace(
        name: 'Fire Station', iconPath: 'assets/icons/fire_station.png'),
    NearByPlace(name: 'Gas Station', iconPath: 'assets/icons/gas_station.png'),
    NearByPlace(name: 'Gym', iconPath: 'assets/icons/gym.png'),
    NearByPlace(name: 'Hospital', iconPath: 'assets/icons/hospital.png'),
    NearByPlace(name: 'Metro Station', iconPath: 'assets/icons/atm.png'),
    NearByPlace(name: 'Mosque', iconPath: 'assets/icons/metro.png'),
    NearByPlace(name: 'Museum', iconPath: 'assets/icons/museum.png'),
    NearByPlace(name: 'Parking', iconPath: 'assets/icons/parking.png'),
    NearByPlace(
        name: 'Railway Station', iconPath: 'assets/icons/railway_station.png'),
    NearByPlace(name: 'Restaurant', iconPath: 'assets/icons/restaurant.png'),
    NearByPlace(name: 'School', iconPath: 'assets/icons/school.png'),
    NearByPlace(name: 'Shopping Mall', iconPath: 'assets/icons/mall.png'),
    NearByPlace(name: 'Supermarket', iconPath: 'assets/icons/supermarket.png'),
    NearByPlace(name: 'University', iconPath: 'assets/icons/university.png'),
    NearByPlace(name: 'Zoo', iconPath: 'assets/icons/zoo.png'),
  ];

  static List<WonderOfWorld> wondersOfWorldList = [
    WonderOfWorld(
        name: 'Chichen Itza',
        iconPath: 'assets/icons/chichen_itza.jpg',
        latLng: const LatLng(20.683411, -88.569037)),
    WonderOfWorld(
        name: 'Christ the Redeemer',
        iconPath: 'assets/icons/christ_the_redeemer_icon.jpg',
        latLng: const LatLng(-22.9518876, -43.2105598)),
    WonderOfWorld(
        name: 'Colosseum Rome',
        iconPath: 'assets/icons/colosseum_rome_icon.jpg',
        latLng: const LatLng(41.889367, 12.492473)),
    WonderOfWorld(
        name: 'Great Wall of China',
        iconPath: 'assets/icons/great_wall_of_china.jpg',
        latLng: const LatLng(40.4343426, 116.5643295)),
    WonderOfWorld(
        name: 'Machu Picchu',
        iconPath: 'assets/icons/machu_picchu.jpg',
        latLng: const LatLng(-13.1631, -72.5450)),
    WonderOfWorld(
        name: 'Petra',
        iconPath: 'assets/icons/petra.jpg',
        latLng: const LatLng(30.3221356, 35.4517434)),
    WonderOfWorld(
        name: 'Taj Mahal',
        iconPath: 'assets/icons/taj_mahal_icon.jpg',
        latLng: const LatLng(27.173404, 78.042120)),
  ];
}
