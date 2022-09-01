import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async';
import 'dart:ui' as ui;

import 'package:nearby_location_finder/domain/app_location.dart';
import 'package:nearby_location_finder/resources/app_location_helper.dart';
import 'package:nearby_location_finder/resources/assets.dart';
import 'package:nearby_location_finder/resources/color.dart';
import 'package:nearby_location_finder/resources/text_style.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => CurrentLocationScreenState();
}

class CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> dropoffMarkers = {};
  CameraPosition initialLocation = const CameraPosition(
    target: LatLng(33.738045, 73.084488),
    zoom: 14.4746,
  );
  AppLocation currentLocation = const AppLocation(33.738045, 73.084488);
  final location = Location();

  bool isLoading = true;

  late BitmapDescriptor customIcon;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void setUserLocation() async {
    try {
      AppLocation? location = await AppLocationHelper.getUserLocation();

      if (location != null) {
        _controller.future.then(((value) {
          value.moveCamera(CameraUpdate.newLatLng(
              LatLng(location.latitude, location.longitude)));
        }));
        currentLocation = location;
        getBytesFromAsset(AppAssets.markerIcon, 100).then((markerIcon) {
          customIcon = BitmapDescriptor.fromBytes(markerIcon);
          setState(() {
            dropoffMarkers.add(Marker(
                markerId: const MarkerId('current_location'),
                position: LatLng(location.latitude, location.longitude),
                icon: customIcon));
          });
        });
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    setUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: const Text(
          "Location",
          style: AppTextStyle.body1,
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryDark,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ))
          : GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: initialLocation,
              markers: dropoffMarkers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: AppColor.primaryDark,
            child: const Icon(
              Icons.location_on,
              color: AppColor.secondaryColor,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                _controller.future.then(((value) async {
                  await value.animateCamera(CameraUpdate.newLatLng(LatLng(
                      currentLocation.latitude, currentLocation.longitude)));
                }));
              });
            },
          )),
    );
  }
}
