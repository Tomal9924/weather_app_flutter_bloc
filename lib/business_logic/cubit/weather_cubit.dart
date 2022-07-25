import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:piistech_weather_flutter_bloc/business_logic/model/weather.dart';
import 'package:piistech_weather_flutter_bloc/business_logic/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  late WeatherRepository _repo;

  WeatherCubit() : super(WeatherInitial()) {
    _repo = WeatherRepository();
  }

  void get(String city) {
    emit(WeatherNetworking());
    _repo.getData(city).then((response) {
      if (response.success) {
        final WeatherData data = WeatherData.fromJson(json.decode(response.result!));
        emit(WeatherSuccess(data));
      } else {
        emit(
          WeatherError(response.error),
        );
      }
    });
  }
}
