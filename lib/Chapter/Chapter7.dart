import 'package:flutter/material.dart';
import 'package:flutter_debby/Bean/Weather.dart';
import 'package:flutter_debby/Net/HttpRequest.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  Weather weather;

  TextField field = TextField(
    controller: TextEditingController(),
    onSubmitted: (text) {
      print(text);
    },
    decoration: InputDecoration(
        hintText: "城市", hintStyle: TextStyle(color: Colors.white)),
  );

  @override
  void initState() {
    super.initState();
    getWeather(
      (data) {
        setState(() {
          weather = data;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('天气')),
      ),
      body: Container(
          child: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height / 3,
            child: Card(
              child: Image.asset(
                "images/web2.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: width,
            height: height / 3,
            child: weather == null ? Text('') : WeatherCard(weather),
          ),
          Positioned(
            right: 8.0,
            child: Container(
              width: 60.0,
              height: 40.0,
              child: field,
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getWeather((data) {
            setState(() {
              weather = data;
            });
          }, city: field.controller.text);
          getTest();
        },
        child: Icon(Icons.http),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  WeatherCard(this.weather);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.0, 0.0),
      children: <Widget>[
        Positioned(
          top: 8.0,
          left: 8.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(60),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: MyText('${weather.city}'),
            ),
          ),
        ),
        Positioned(
          child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: MyText(
                '${weather.data.wendu}℃ | ${weather.data.forecast[0].type}',
                textSize: 24.0,
              )),
        ),
        Positioned(
          bottom: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyText(
                  '${weather.data.forecast[0].low.substring(2)} ~${weather.data.forecast[0].high.substring(2)}'),
              MyText('空气质量：${weather.data.quality}'),
              MyText('pm2.5：${weather.data.pm25}| pm10：${weather.data.pm10}'),
            ],
          ),
        ),
      ],
    );
  }
}

class MyText extends StatelessWidget {
  final String text;
  final double textSize;
  final _textStyle = TextStyle(color: Colors.white);

  MyText(this.text, {this.textSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _textStyle.copyWith(fontSize: textSize),
    );
  }
}
