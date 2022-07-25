import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Helper {
  String detectForecast(String forecast) {
    switch (forecast) {
      case "haze":
        return 'images/haze.png';
      case "Snow":
        return 'images/snow.png';

      case "broken clouds":
        return 'images/cloudy.png';

      case "clear sky":
        return 'images/beach.png';

      case "scattered clouds":
        return 'images/storm.png';

      case "few clouds":
        return 'images/few_clouds.png';

      case "moderate rain":
        return 'images/rainy.png';

      case "mist":
        return 'images/mist.png';

      case "smoke":
        return 'images/smoky.png';

      case "Clouds":
        return 'images/cloudy.png';

      case "Clear":
        return 'images/sunny.png';

      case "Rain":
        return 'images/rainy.png';

      default:
        return 'images/beach.png';
    }
    return "";
  }

  IconData measureWeatherCast(String data) {
    switch (data) {
      case "haze":
        return MdiIcons.weatherFog;
      case "Snow":
        return Icons.snowing;

      case "broken clouds":
        return Icons.thunderstorm;

      case "clear sky":
        return MdiIcons.weatherSunny;

      case "scattered clouds":
        return MdiIcons.weatherCloudy;

      case "few clouds":
        return MdiIcons.weatherCloudy;

      case "moderate rain":
        return MdiIcons.weatherPouring;

      case "mist":
        return MdiIcons.weatherFog;

      case "smoke":
        return MdiIcons.weatherFog;

      case "Clouds":
        return MdiIcons.weatherCloudy;

      case "Clear":
        return MdiIcons.weatherSunny;

      case "Rain":
        return MdiIcons.weatherRainy;

      default:
        return MdiIcons.weatherRainy;
    }
  }

  double getTempData(double temp) {
    return (temp - 273.15);
  }
}
