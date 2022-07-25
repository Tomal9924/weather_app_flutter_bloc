import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piistech_weather_flutter_bloc/business_logic/cubit/weather_cubit.dart';
import 'package:piistech_weather_flutter_bloc/utils/palette.dart';
import 'package:piistech_weather_flutter_bloc/utils/text_styles.dart';
import 'package:piistech_weather_flutter_bloc/view/screens/screen_dashboard.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => WeatherCubit(),
    child: Dashboard(),
  ));
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: ColorPalette.swatch,
        backgroundColor: ColorPalette.background,
        canvasColor: ColorPalette.background,
        shadowColor: ColorPalette.shadow,
        indicatorColor: ColorPalette.accent,
        splashColor: ColorPalette.divider,
        highlightColor: ColorPalette.swatch.shade100,
        splashFactory: InkRipple.splashFactory,
        dividerColor: ColorPalette.divider,
        dividerTheme: DividerThemeData(color: ColorPalette.divider, space: 1, thickness: 1),
        primaryColor: ColorPalette.accent,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: ColorPalette.tag.primary,
          labelStyle: TextStyles.body(context: context, color: ColorPalette.text),
          contentPadding: const EdgeInsets.all(16.0),
          hintStyle: TextStyles.caption(context: context, color: ColorPalette.hint),
          errorStyle: TextStyles.caption(context: context, color: ColorPalette.error).copyWith(height: 0, fontSize: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: ColorPalette.accent, width: 1)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette.error, width: .5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette.error, width: 1.5),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ColorPalette.accent,
            elevation: 1,
            shadowColor: ColorPalette.shadow,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: ColorPalette.accent,
            shadowColor: ColorPalette.shadow,
            backgroundColor: ColorPalette.background,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(16),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: ColorPalette.text),
        iconTheme: IconThemeData(color: ColorPalette.text, size: 20),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorPalette.accent),
          actionsIconTheme: IconThemeData(color: ColorPalette.accent),
          backgroundColor: ColorPalette.background,
          elevation: 0,
        ),
      ),
      home: ScreenDashboard(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
