import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:piistech_weather_flutter_bloc/business_logic/cubit/weather_cubit.dart';
import 'package:piistech_weather_flutter_bloc/business_logic/model/weather.dart';
import 'package:piistech_weather_flutter_bloc/utils/helper.dart';
import 'package:piistech_weather_flutter_bloc/utils/palette.dart';
import 'package:piistech_weather_flutter_bloc/utils/text_styles.dart';
import 'package:piistech_weather_flutter_bloc/view/constants.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherCubit>(context).get("Dhaka");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.swatch.shade900,
      appBar: AppBar(
        backgroundColor: ColorPalette.swatch.shade900,
        title: Text(
          DateFormat("dd MMM,yyyy").format(DateTime.now()),
          style: TextStyles.title(context: context, color: ColorPalette.background),
        ),
        elevation: 0,
      ),
      body: RefreshIndicator(
        color: ColorPalette.text,
        onRefresh: () async {
          BlocProvider.of<WeatherCubit>(context).get("Dhaka");
        },
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (_, state) {
            if (state is WeatherError) {
              return const Icon(Icons.error);
            } else if (state is WeatherNetworking) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherSuccess) {
              WeatherData data = state.data!;
              return Center(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper().detectForecast(data.list.first.weather.first.main.toString()),
                          height: 128,
                          width: 128,
                          color: ColorPalette.background,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${data.list.first.main.temp.round().toString()}°c",
                              style: TextStyles.title(context: context, color: ColorPalette.background)
                                  .copyWith(fontSize: 90),
                            ),
                            SizedBox(width: 8),
                            Text(
                              data.city.name,
                              style: TextStyles.body(context: context, color: ColorPalette.background),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Humidity",
                              style: TextStyles.caption(context: context, color: ColorPalette.background),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${data.list.first.main.humidity.toString()}%",
                              style: TextStyles.body(context: context, color: ColorPalette.background),
                            ),
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            Text(
                              "Min temp",
                              style: TextStyles.caption(context: context, color: ColorPalette.background),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${Helper().getTempData(data.list.first.main.tempMin).toInt().toString()} °c",
                              style: TextStyles.body(context: context, color: ColorPalette.background),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Feels like",
                              style: TextStyles.caption(context: context, color: ColorPalette.background),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${Helper().getTempData(data.list.first.main.feelsLike).round().toString()}°c",
                              style: TextStyles.body(context: context, color: ColorPalette.background),
                            ),
                          ],
                        ),
                        Divider(),
                        Column(
                          children: [
                            Text(
                              "Max temp",
                              style: TextStyles.caption(context: context, color: ColorPalette.background),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${Helper().getTempData(data.list.first.main.tempMax).toInt().toString()} °c",
                              style: TextStyles.body(context: context, color: ColorPalette.background),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.list.length,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (BuildContext context, int index) {
                          final ListElement element = data.list.elementAt(index);
                          final Weather? weather = element.weather.firstOrNull;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration:
                                  BoxDecoration(color: ColorPalette.dark, borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat("dd/MM/yy").format(element.dtTxt).toString(),
                                    style: TextStyles.caption(context: context, color: ColorPalette.background),
                                  ),
                                  const SizedBox(height: 8),
                                  Icon(
                                    Helper().measureWeatherCast(weather?.main ?? ""),
                                    size: 36,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    DateFormat("hh:mm a").format(element.dtTxt).toString(),
                                    style: TextStyles.caption(context: context, color: ColorPalette.background),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${element.main.temp.round().toString()}°c",
                                    style: TextStyles.caption(context: context, color: ColorPalette.background),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        "v $appVersion",
                        style: TextStyles.caption(context: context, color: ColorPalette.background),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Icon(Icons.help);
            }
          },
        ),
      ),
    );
  }
}
