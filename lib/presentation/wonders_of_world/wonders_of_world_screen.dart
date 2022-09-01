import 'package:flutter/material.dart';
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
            childAspectRatio: ((MediaQuery.of(context).size.width / 2) /
                ((MediaQuery.of(context).size.height - 60 - 24) / 4)),
            crossAxisCount: 2,
            children: List.generate(
                23,
                (index) => GestureDetector(
                      onTap: () {
                        openMap(AppConstants.nearByPlacesList[index]);
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            AppConstants.nearByPlacesList[index],
                            style: AppTextStyle.body2,
                          ),
                        ),
                      ),
                    )),
          ),
        ));
  }

  static Future<void> openMap(String place) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&z=2&query=$place';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
