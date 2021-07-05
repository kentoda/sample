import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main () => runApp(
  MaterialApp(
    title: "お天気アプリ",
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState () {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  var temp;
  var description ;
  var currently;
  var humidity;
  var windSpeed;

  Future  getWeather  () async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=tokyo&units=metric&lang=ja&appid=db02ba4c5048607575bf977d83f923d7');
    http.Response response = await http.get(url);
    var results = jsonDecode(response.body);
    setState(() {
      this.temp =  results['main']['temp'];
      this.description = results['weather'][0]['description'] ;
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState () {
    super.initState();
    this.getWeather();
  }


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "東京の今日のお天気",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ),
                Text(
                  temp != null ? temp.toString() + "\u00B0" : "loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("気温"),
                    trailing: Text(temp != null ? temp.toString() + "\u00B0" : "loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("お天気"),
                    trailing: Text(description != null ? description.toString() : "loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("湿度"),
                    trailing: Text(humidity != null ? humidity.toString() : "loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("風速"),
                    trailing: Text(windSpeed != null ? windSpeed.toString() : "loading"),
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

}
