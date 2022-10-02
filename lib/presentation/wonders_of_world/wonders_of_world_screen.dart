import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nearby_location_finder/resources/color.dart';
import 'package:nearby_location_finder/resources/constant.dart';
import 'package:nearby_location_finder/resources/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class WondersOfWorldScreen extends StatefulWidget {
  const WondersOfWorldScreen({super.key});

  @override
  WondersOfWorldScreenState createState() {
    return WondersOfWorldScreenState();
  }
}

class WondersOfWorldScreenState extends State<WondersOfWorldScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          title: Text(
            "Wonders of World",
            style: AppTextStyle.body1
                .copyWith(color: Theme.of(context).colorScheme.surface),
          ),
          centerTitle: true,
          backgroundColor: AppColor.primaryDark,
        ),
        body: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: AppColor.primaryLight)),
          child: GridView.count(
            childAspectRatio: ((MediaQuery.of(context).size.width / 2) /
                ((MediaQuery.of(context).size.height - 60 - 24) / 4)),
            crossAxisCount: 2,
            children: List.generate(
                AppConstants.wondersOfWorldList.length,
                (index) => GestureDetector(
                      onTap: () {
                        openMap(AppConstants.wondersOfWorldList[index].latLng,
                            AppConstants.wondersOfWorldList[index].name);
                      },
                      child: Card(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(AppConstants
                                    .wondersOfWorldList[index].iconPath),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Text(
                                AppConstants.wondersOfWorldList[index].name,
                                style: AppTextStyle.body3Medium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ));
  }

  static Future<void> openMap(LatLng latlng, String name) async {
    String googleUrl = name.toUpperCase() == 'GREAT WALL OF CHINA'
        ? 'https://www.google.com/maps/search/?api=1&query=${latlng.latitude}%2C${latlng.longitude}'
        : 'https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=${latlng.latitude}%2C${latlng.longitude}';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
