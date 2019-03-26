import 'package:dio/dio.dart';
import 'package:flutter_debby/Bean/Weather.dart';

BaseOptions options = BaseOptions(
  baseUrl: "https://www.sojson.com/open/api/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

final String path = 'weather/json.shtml';

typedef WeatherData(Weather data);

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

getTest() async {
  var dio = Dio();
  Response response =
      await dio.get('https://debby.oss-cn-beijing.aliyuncs.com/test.json');
  print(response.data);
}
