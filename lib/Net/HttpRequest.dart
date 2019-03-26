import 'package:dio/dio.dart';
import 'package:flutter_debby/Bean/Weather.dart';
import 'package:flutter_debby/Bean/GanHo.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://www.sojson.com/open/api/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

final String path = 'weather/json.shtml';

typedef WeatherData(Weather data);

typedef OnGetMessage(Fuli message);

getWeather(WeatherData data, {String city}) async {
  var dio = Dio(options);
  if (city == null || city == '') city = '南京';
  Response response = await dio.get(path, queryParameters: {'city': city});
  int state = response.data['status'];
  print('statusCode=$state');
  if (state != 200) return;
  Weather weather = Weather.fromJson(response.data);
  print('statusCode=${response.statusCode},weather= $weather');
  data(weather);
}

getTest(OnGetMessage onMessage) async {
  var dio = Dio();
  try {
    Response response = await dio.get("http://gank.io/api/today");
    bool state = response.data['error'];
    if (!state) {
      GanHo ganHo = GanHo.fromJson(response.data);
      print(ganHo.results.fuli[2].toString());
      onMessage(ganHo.results.fuli[2]);
    }
  } catch (e) {
    print("response" + e);
  }
}
