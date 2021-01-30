import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/homeScreen.dart';
import 'package:quiver/async.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int elapsed = 1;

  void _animate() {
    final cd =
    CountdownTimer(Duration(seconds: 1), Duration(milliseconds: 250));
    cd.listen((data) {
      setState(() {
        elapsed = cd.elapsed.inMilliseconds;
      });
    }, onDone: () {
      cd.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    _animate();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 60,
                  right: 60,
                  left: 0,
                  child: Opacity(
                    opacity: elapsed >= 500 ? 1 : 0,
                    child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage(
                            'assets/2.png'),
                        //YELLOW
                        key: ValueKey(elapsed)),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 150,
                  top: 30,
                  child: Opacity(
                    opacity: elapsed >= 750 ? 1 : 0,
                    child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage(
                            'assets/4.png'), //RED
                        key: ValueKey(elapsed)),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 90,
                  left: 10,
                  child: Opacity(
                    opacity: elapsed >= 250 ? 1 : 0,
                    child: Image(
                        height: 200,
                        width: 200,
                        image: AssetImage(
                            'assets/1.png'),
                        //BLUE
                        key: ValueKey(elapsed)),
                  ),
                ),
                Positioned(
                  right: 1,
                  top: 100,
                  child: Opacity(
                    opacity: elapsed >= 1000 ? 1 : 0,
                    child: Image(
                        height: 220,
                        width: 220,
                        image: AssetImage(
                            'assets/3.png'),
                        //PURPLE
                        key: ValueKey(elapsed)),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  top: 0,
                  child: Image(
                    height: 170,
                    width: 160,
                    image: AssetImage(
                        'assets/logo.png'),
                    //BLUE
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
