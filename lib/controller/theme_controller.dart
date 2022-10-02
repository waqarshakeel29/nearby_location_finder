import 'package:flutter/material.dart';
import 'package:nearby_location_finder/resources/color.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: AppColor.primaryColor,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColor.primaryColor,
          onPrimary: AppColor.primaryColorDark,
          secondary: AppColor.secondaryColor,
          onSecondary: AppColor.secondaryColorDark,
          error: Colors.red,
          onError: Colors.red,
          background: AppColor.secondaryColor,
          onBackground: AppColor.secondaryColor,
          surface: AppColor.secondaryColor,
          onSurface: AppColor.secondaryColor,
        ));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        primaryColor: AppColor.primaryColorDark,
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColor.primaryColor,
          onPrimary: AppColor.primaryColorDark,
          secondary: AppColor.secondaryColor,
          onSecondary: AppColor.secondaryColorDark,
          error: Colors.red,
          onError: Colors.red,
          background: AppColor.secondaryColorDark,
          onBackground: AppColor.secondaryColorDark,
          surface: AppColor.secondaryColorDark,
          onSurface: AppColor.secondaryColorDark,
        ));
  }

  ThemeData getTheme() {
    return themeMode == ThemeMode.light ? getLightTheme() : getDarkTheme();
  }

  onChange(ThemeMode mode) {
    themeMode = mode;
    notifyListeners();
  }
}
