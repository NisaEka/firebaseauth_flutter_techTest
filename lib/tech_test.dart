import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_test/const/color.dart';
import 'package:tech_test/const/textstyle.dart';
import 'package:tech_test/screen/auth/auth_screen.dart';
import 'package:tech_test/screen/auth/login/login_screen.dart';

class TechTest extends StatelessWidget {
  const TechTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // translations: AppTranslation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("en", "US"),
      debugShowCheckedModeBanner: false,
      title: 'TechTest ABM',
      theme: ThemeData(
        // useMaterial3: true,
        fontFamily: 'plus jakarta sans',
        backgroundColor: baseColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: whiteColor,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: whiteColor,
          labelStyle: hintTextStyle.copyWith(color: blackColor),
          hintStyle: hintTextStyle,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: neutralColor,
              width: 1,
              // style: BorderStyle.solid,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              minimumSize: const Size(100, 40),
              side: const BorderSide(color: infoColor),
              foregroundColor: infoColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              elevation: MaterialStateProperty.resolveWith<double>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return 0;
                  }
                  return 0; // Defer to the widget's default.
                },
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontWeight: FontWeight.w700, fontSize: 16))),
        ),
      ),
      home: const AuthScreen(),
    );
  }
}
