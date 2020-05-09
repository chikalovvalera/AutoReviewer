import 'package:auto_reviewer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    //DB load

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
          children: <Widget>[
            Container(decoration: BoxDecoration(color: Colors.redAccent)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: Icon(
                            Icons.attach_money,
                            color: Colors.black38,
                            size: 100
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:10.0)
                        ),
                        Text(
                          'BuyBuyCar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(),
                      // CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        'by Chikalov V.M.',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),

                )
              ],
            )
          ],
        ),
      );
    }


}