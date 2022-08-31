import 'package:flutter/material.dart';
import 'package:nearby_location_finder/resources/color.dart';
import 'package:nearby_location_finder/resources/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyPlacesScreen extends StatefulWidget {
  const NearbyPlacesScreen({super.key});

  @override
  NearbyPlacesScreenState createState() {
    return NearbyPlacesScreenState();
  }
}

class NearbyPlacesScreenState extends State<NearbyPlacesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: const Text(
            "Nearby Places",
            style: AppTextStyle.body1,
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryDark,
        ),
        body: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: AppColor.primaryLight)),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: ((MediaQuery.of(context).size.width / 2) /
                ((MediaQuery.of(context).size.height - 60 - 24) / 4)),
            crossAxisCount: 2,
            children: List.generate(7, (index) => gridItem(index)),
          ),
        ));
  }

  gridItem(int index) {
    var tileTitle = '';
    switch (index) {
      case 0:
        tileTitle = 'Current Location';
        break;
      case 1:
        tileTitle = 'Nearby Places';
        break;
      case 2:
        tileTitle = 'Directions';
        break;
      case 3:
        tileTitle = 'Famous Places';
        break;
      case 4:
        tileTitle = 'Feedback';
        break;
      case 5:
        tileTitle = 'Rating';
        break;
      default:
        tileTitle = 'Exit';
        break;
    }
    return GestureDetector(
      onTap: () {
        openMap();
      },
      child: Card(
        child: Center(
          child: Text(
            tileTitle,
            style: AppTextStyle.body2,
          ),
        ),
      ),
    );
  }

  static Future<void> openMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=hospital';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
