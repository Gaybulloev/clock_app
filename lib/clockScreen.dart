import 'dart:convert';
import 'dart:io';
import 'package:clock_app/weather.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';




class ClockScreen extends StatefulWidget {


  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  Future<Weather> _weather;
  Weather weather;

  Future<Weather> getWeatherFromXml(BuildContext context) async{
    final url = Uri.parse('http://my2.dev.gov.uz/azamat/ru/weather/get-details?region=tashkent');
    final request = await HttpClient().getUrl(url);
    final response = await request.close();
    await response
        .transform(utf8.decoder)
        .toXmlEvents()
        .selectSubtreeEvents((event) => event.name == 'stdClass')
        .toXmlNodes()
        .flatten()
        .cast<XmlElement>()
            .map((element) {
          if (element.name.qualified == 'stdClass') {
            return  Weather(
              cloud_amount : element.getAttribute('cloud_amount'),
              name : element.getAttribute("name"),
              air_t: element.getAttribute('air_t')
            );
          }
        })
            .forEach(print);
  }
  @override
  void initState() {
    _weather= getWeatherFromXml(context);
    super.initState();
  }

  @override
  DateTime now = new DateTime.now();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/icons/background.png"),
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 6.0,
            top: 65.0,
            right: 6.0,
            bottom: 220.0,
            child: Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border(
                      left: BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0
                      ),
                      right: BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0
                      ),
                      top: BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0
                      ),
                      bottom: BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0
                      )
                  )
              ),

              child: Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(height:70,),
                    Text(
                      DateFormat().add_Hm().format(now),
                      style: TextStyle(
                          fontSize: size.height*0.1,
                          fontWeight: FontWeight.bold
                      ),),

                    SizedBox(height :30.0),
                    Text(
                      DateFormat('d MMMM').format(now),
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(DateFormat('EEEE').format(now),
                      style: TextStyle(
                          fontSize: 55.0
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            //     top: 500,
            left: 80,
            bottom: 615,

            child: Align(
                child: Image.asset('assets/icons/gerb.png',
                  width: 250,
                  height: 150,)
            ),
          ),

          Positioned(
            bottom: 55,
            child: Row(
              children: <Widget>[
                Align(
                    child: Image.asset('assets/icons/clear.png',
                      width: 220,
                      height: 120,)
                ),
               FutureBuilder<Weather>(
                 future: _weather,
                 builder: (context,snapshot){
                   if(snapshot.hasData){
                     return Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                          Text('${snapshot.data.name}',
                            style: TextStyle(
                            fontSize: 75.0
                        ),),

                           Text("${snapshot.data.cloud_amount}",
                         style: TextStyle(
                         fontSize: 45.0,
                          )
                          ),
                       ],
                     );
                   } else Container();
                 },
               )
              ],

            ),
          )
        ],
      ),

    );
  }

}
