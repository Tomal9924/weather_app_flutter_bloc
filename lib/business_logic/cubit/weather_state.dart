part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherError extends WeatherState {
  final String? error;

  WeatherError(this.error);
}

class WeatherNetworking extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherData? data;

  WeatherSuccess(this.data);
}
