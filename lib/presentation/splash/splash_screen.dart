import 'package:flutter/material.dart';
import 'package:nearby_location_finder/resources/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(child: Image.asset(AppAssets.appIcon)),
      ),
    );
  }
}
