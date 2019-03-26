import 'dart:convert' show json;


class Weather {

  int count;
  int status;
  String city;
  String date;
  String message;
  Base data;


  Weather.fromParams(
      {this.count, this.status, this.city, this.date, this.message, this.data});

  factory Weather(jsonStr) =>
      jsonStr is String ? Weather.fromJson(json.decode(jsonStr)) : Weather
          .fromJson(jsonStr);

  Weather.fromJson(jsonRes) {
    count = jsonRes['count'];
    status = jsonRes['status'];
    city = jsonRes['city'];
    date = jsonRes['date'];
    message = jsonRes['message'];
    data = new Base.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"count": $count,"status": $status,"city": ${city != null ? '${json
        .encode(city)}' : 'null'},"date": ${date != null ? '${json.encode(
        date)}' : 'null'},"message": ${message != null ? '${json.encode(
        message)}' : 'null'},"data": $data}';
  }
}


class Base {

  double pm10;
  double pm25;
  String ganmao;
  String quality;
  String shidu;
  String wendu;
  List<Forecast> forecast;
  Yesterday yesterday;


  Base.fromParams(
      {this.pm10, this.pm25, this.ganmao, this.quality, this.shidu, this.wendu, this.forecast, this.yesterday});

  Base.fromJson(jsonRes) {
    pm10 = jsonRes['pm10'];
    pm25 = jsonRes['pm25'];
    ganmao = jsonRes['ganmao'];
    quality = jsonRes['quality'];
    shidu = jsonRes['shidu'];
    wendu = jsonRes['wendu'];
    forecast = [];

    for (var forecastItem in jsonRes['forecast']) {
      forecast.add(new Forecast.fromJson(forecastItem));
    }

    yesterday = new Yesterday.fromJson(jsonRes['yesterday']);
  }

  @override
  String toString() {
    return '{"pm10": $pm10,"pm25": $pm25,"ganmao": ${ganmao != null ? '${json
        .encode(ganmao)}' : 'null'},"quality": ${quality != null ? '${json
        .encode(quality)}' : 'null'},"shidu": ${shidu != null ? '${json.encode(
        shidu)}' : 'null'},"wendu": ${wendu != null
        ? '${json.encode(wendu)}'
        : 'null'},"forecast": $forecast,"yesterday": $yesterday}';
  }
}


class Yesterday {

  double aqi;
  String date;
  String fl;
  String fx;
  String high;
  String low;
  String notice;
  String sunrise;
  String sunset;
  String type;


  Yesterday.fromParams(
      {this.aqi, this.date, this.fl, this.fx, this.high, this.low, this.notice, this.sunrise, this.sunset, this.type});

  Yesterday.fromJson(jsonRes) {
    aqi = jsonRes['aqi'];
    date = jsonRes['date'];
    fl = jsonRes['fl'];
    fx = jsonRes['fx'];
    high = jsonRes['high'];
    low = jsonRes['low'];
    notice = jsonRes['notice'];
    sunrise = jsonRes['sunrise'];
    sunset = jsonRes['sunset'];
    type = jsonRes['type'];
  }

  @override
  String toString() {
    return '{"aqi": $aqi,"date": ${date != null
        ? '${json.encode(date)}'
        : 'null'},"fl": ${fl != null
        ? '${json.encode(fl)}'
        : 'null'},"fx": ${fx != null
        ? '${json.encode(fx)}'
        : 'null'},"high": ${high != null
        ? '${json.encode(high)}'
        : 'null'},"low": ${low != null
        ? '${json.encode(low)}'
        : 'null'},"notice": ${notice != null
        ? '${json.encode(notice)}'
        : 'null'},"sunrise": ${sunrise != null
        ? '${json.encode(sunrise)}'
        : 'null'},"sunset": ${sunset != null
        ? '${json.encode(sunset)}'
        : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'}}';
  }
}


class Forecast {

  double aqi;
  String date;
  String fl;
  String fx;
  String high;
  String low;
  String notice;
  String sunrise;
  String sunset;
  String type;

  Forecast.fromParams(
      {this.aqi, this.date, this.fl, this.fx, this.high, this.low, this.notice, this.sunrise, this.sunset, this.type});

  Forecast.fromJson(jsonRes) {
    aqi = jsonRes['aqi'];
    date = jsonRes['date'];
    fl = jsonRes['fl'];
    fx = jsonRes['fx'];
    high = jsonRes['high'];
    low = jsonRes['low'];
    notice = jsonRes['notice'];
    sunrise = jsonRes['sunrise'];
    sunset = jsonRes['sunset'];
    type = jsonRes['type'];
  }

  @override
  String toString() {
    return '{"aqi": $aqi,"date": ${date != null
        ? '${json.encode(date)}'
        : 'null'},"fl": ${fl != null
        ? '${json.encode(fl)}'
        : 'null'},"fx": ${fx != null
        ? '${json.encode(fx)}'
        : 'null'},"high": ${high != null
        ? '${json.encode(high)}'
        : 'null'},"low": ${low != null
        ? '${json.encode(low)}'
        : 'null'},"notice": ${notice != null
        ? '${json.encode(notice)}'
        : 'null'},"sunrise": ${sunrise != null
        ? '${json.encode(sunrise)}'
        : 'null'},"sunset": ${sunset != null
        ? '${json.encode(sunset)}'
        : 'null'},"type": ${type != null ? '${json.encode(type)}' : 'null'}}';
  }
}

