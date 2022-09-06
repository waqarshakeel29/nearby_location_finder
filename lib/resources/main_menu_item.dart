import 'package:flutter/material.dart';
import 'package:nearby_location_finder/resources/text_style.dart';

class MainMenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final Function() onTap;
  const MainMenuItem(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Image(
                  image: AssetImage(iconPath),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              Text(
                title,
                style: AppTextStyle.body3Medium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
