import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fly_bird_game/barriers.dart';
import 'package:flutter_fly_bird_game/bird.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;
  static double barriarXone = 1;
  double barriarXtwo = barriarXone + 1.5;
  final TextStyle style = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
  );

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if (barriarXone < -2) {
          barriarXone += 3.5;
        } else {
          barriarXone -= 0.05;
        }
      });

      setState(() {
        if (barriarXtwo < -2) {
          barriarXtwo += 3.5;
        } else {
          barriarXtwo -= 0.05;
        }
      });

      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    duration: Duration(
                      milliseconds: 0,
                    ),
                    color: Colors.blue,
                    child: FlappyBird(),
                  ),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: gameHasStarted
                        ? Text(" ")
                        : Text(
                            "T A P  T O  S T A R T",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barriarXone, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: LocationBarriers(
                      size: 180.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barriarXone, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: LocationBarriers(
                      size: 180.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barriarXtwo, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: LocationBarriers(
                      size: 130.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barriarXtwo, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: LocationBarriers(
                      size: 230.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green,
              height: 20,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SCORE",
                          style: style,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "0",
                          style: style,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BEST SCORE",
                          style: style,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "10",
                          style: style,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
