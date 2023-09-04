import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final appColorLightProvider = Provider<AppColor>((ref) => AppColor(
      primaryLight: primaryLight,
      blueish: blueish,
      redish: redish,
    ));

class AppColor {
  MaterialColor primaryLight;
  MaterialColor blueish;
  MaterialColor redish;
  AppColor({
    required this.primaryLight,
    required this.blueish,
    required this.redish,
  });
}

//-------------------------------------------------------
ThemeData lightThemeData = ThemeData(
  colorScheme: colorSchemeLight,
  textTheme: textThemeLight,
  primaryColor: primaryLight,
  scaffoldBackgroundColor: primaryLight,
  primaryTextTheme: textThemeLight,
  splashColor: primaryLight,
  unselectedWidgetColor: redish,
  canvasColor: primaryLight,
  dialogBackgroundColor: primaryLight,
  buttonTheme: const ButtonThemeData(
    buttonColor: blueish,
    alignedDropdown: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: blueish)),
  dividerColor: primaryLight.shade100,
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: textThemeLight.bodyMedium!.copyWith(color: redish),
      helperStyle: textThemeLight.bodyMedium!.copyWith(color: redish),
      labelStyle: textThemeLight.bodyMedium!.copyWith(color: redish)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(color: primaryLight.shade200),
    unselectedIconTheme: IconThemeData(color: blueish),
  ),
);

TextTheme textThemeLight = TextTheme(
  headlineSmall: TextStyle(
    fontWeight: FontWeight.bold,
    height: 1.25,
    color: primaryLight.shade200,
  ),
  titleSmall: TextStyle(
    fontWeight: FontWeight.bold,
    height: 1.25,
    color: primaryLight.shade200,
  ),
  displayLarge: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    height: 1.5,
    color: primaryLight.shade200,
  ),
  displayMedium: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    height: 1.5,
    color: primaryLight.shade200,
  ),
  displaySmall: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    height: 1.2,
    color: primaryLight.shade200,
  ),
  bodyLarge: TextStyle(
    fontWeight: FontWeight.bold,
    height: 1.2,
    color: primaryLight.shade200,
  ),
);

var colorSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: primaryLight.shade200,
  onPrimary: primaryLight, //white

  secondary: blueish,
  error: redish,
  onError: redish,
  background: primaryLight,
  surface: primaryLight, onBackground: primaryLight, onSecondary: primaryLight,
  onSurface: primaryLight,
);

const primaryLight = MaterialColor(0xffFFFFFF, {
  100: Color(0xff4A5568),
  200: Color(0xff000000),
  300: Color(0xffF808080),
});

const blueish = MaterialColor(0xff00B7BD, {});
const redish = MaterialColor(0xffFA9191, {
  100: Color(0xffFFE2E0),
  300: Color(0xffFF0000),
  200: Color(0xffFCD2DF),
});
