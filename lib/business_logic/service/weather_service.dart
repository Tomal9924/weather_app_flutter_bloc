import 'package:http/http.dart';
import 'package:piistech_weather_flutter_bloc/utils/api_helper.dart';
import 'package:piistech_weather_flutter_bloc/utils/constants.dart';
import 'package:piistech_weather_flutter_bloc/utils/network_response.dart';

class WeatherService {
  Future<NetworkResponse<String?>> get(String city) async {
    final Response response =
        await ApiHelper.instance.get(Uri.parse('http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$appID'));

    if (response.statusCode == 200) {
      return NetworkResponse(result: response.body, success: true);
    } else {
      return NetworkResponse(result: null, success: false, error: response.reasonPhrase);
    }
  }
}
