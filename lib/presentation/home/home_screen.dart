import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_location_finder/app_router.gr.dart';
import 'package:nearby_location_finder/resources/color.dart';
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
            "Near by Location",
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
            children: List.generate(6, (index) => gridItem(index)),
          ),
        ));
  }

  gridItem(int index) {
    var tileTitle = '';
    var onTap = () {};
    switch (index) {
      case 0:
        tileTitle = 'Current Location';
        onTap = () {
          GetIt.I<AppRouter>().push(const CurrentLocationScreen());
        };
        break;
      case 1:
        tileTitle = 'Nearby Places';
        onTap = () {
          GetIt.I<AppRouter>().push(const NearbyPlacesScreen());
        };
        break;
      case 2:
        tileTitle = 'Wonders of World';
        onTap = () {
          GetIt.I<AppRouter>().push(const WondersOfWorldScreen());
        };
        break;
      case 3:
        tileTitle = 'Feedback';
        break;
      case 4:
        tileTitle = 'Rating';
        break;
      default:
        tileTitle = 'Exit';
        break;
    }
    return GestureDetector(
      onTap: onTap,
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
}
