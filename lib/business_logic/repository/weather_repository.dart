import 'package:piistech_weather_flutter_bloc/business_logic/service/weather_service.dart';
import 'package:piistech_weather_flutter_bloc/utils/network_response.dart';

class WeatherRepository {
  late WeatherService _service;
  WeatherRepository() {
    _service = WeatherService();
  }
  Future<NetworkResponse<String?>> getData(String city) async {
    return await _service.get(city);
  }
}
