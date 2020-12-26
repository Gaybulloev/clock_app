
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClockScreen(),
    );
  }

}

class ClockScreen extends StatelessWidget{
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
                            fontSize: 65.0
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 15.0, 0),
                      child: Text('+28°',
                        style: TextStyle(
                            fontSize: 75.0
                        ),),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(0,25,10,0),
                      child: Text('Toshkent',
                        style: TextStyle(
                            fontSize: 45.0
                        ),
                      ),
                    )
                  ],
                )
              ],

            ),
          )
        ],
      ),

    );
  }

}

