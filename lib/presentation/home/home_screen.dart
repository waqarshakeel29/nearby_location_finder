import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_location_finder/app_router.gr.dart';
import 'package:nearby_location_finder/resources/color.dart';
import 'package:nearby_location_finder/resources/confimation_dialog.dart';
import 'package:nearby_location_finder/resources/main_menu_item.dart';
import 'package:nearby_location_finder/resources/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
            "Nearby Location",
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
            children: List.generate(5, (index) => gridItem(index)),
          ),
        ));
  }

  gridItem(int index) {
    var tileTitle = '';
    var iconPath = '';
    var onTap = () {};
    switch (index) {
      case 0:
        tileTitle = 'Current Location';
        iconPath = 'assets/icons/current_location_icon.png';
        onTap = () {
          GetIt.I<AppRouter>().push(const CurrentLocationScreen());
        };
        break;
      case 1:
        tileTitle = 'Nearby Places';
        iconPath = 'assets/icons/nearby_places.png';
        onTap = () {
          GetIt.I<AppRouter>().push(const NearbyPlacesScreen());
        };
        break;
      case 2:
        tileTitle = 'Wonders of World';
        iconPath = 'assets/icons/colosseum_rome_icon.jpg';
        onTap = () {
          GetIt.I<AppRouter>().push(const WondersOfWorldScreen());
        };
        break;
      case 3:
        tileTitle = 'Rating';
        iconPath = 'assets/icons/rating.png';
        break;
      default:
        tileTitle = 'Exit';
        iconPath = 'assets/icons/exit.png';
        onTap = () {
          ConfirmationDialog.showConfirmationDialog(
              context: context,
              message: 'Do you want to exit?',
              onClickCancel: () {
                Navigator.pop(context);
              },
              onClickSave: () {
                if (Platform.isAndroid) {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                } else if (Platform.isIOS) {
                  exit(0);
                }
              });
        };
        break;
    }
    return MainMenuItem(title: tileTitle, iconPath: iconPath, onTap: onTap);
  }
}
