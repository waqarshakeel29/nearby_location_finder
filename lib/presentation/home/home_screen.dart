import 'package:flutter/material.dart';
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
          title: const Text(
            "Bonjure",
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
            crossAxisCount: 2,
            children: List.generate(7, (index) {
              return Card(
                child: Center(
                  child: Text(
                    'Item $index',
                    style: AppTextStyle.body2,
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
