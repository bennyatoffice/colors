import 'package:colors/screens/game_over.dart';
import 'package:colors/widget/colorcard.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../widget/colorcard.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int time = 5;
  var score = 0;
  bool isStarted = false;
  bool isTimerStopped = true;
  var randomItem = {"color": Colors.pink, "number": 1};

  void timer() {
    const oneSec = const Duration(seconds: 1);
    this.isTimerStopped = false;
    new Timer.periodic(
      oneSec,
      (Timer t) {
        if (this.isTimerStopped) {
          t.cancel();
        }
        if (time < 1) {
          t.cancel();
          setState(() {
            isStarted = false;
          });
          Navigator.of(context).pushNamed(GameOver.routeName, arguments: score);
        }
        setState(() {
          time = time - 1;
        });
        print('hi');
      },
    );
  }

  void stopTimer() {
    this.isTimerStopped = true;
  }

  cardTapped(int number) {
    print("parent tap");
    setState(() {
      if (number == randomItem['number']) {
        print('Correct number');
        setState(() {
          score = score + 1;
          time = time + 1;
        });
      } else {
        print('Wrong selection');
        stopTimer();
        gameover();
        Navigator.of(context).pushNamed(GameOver.routeName, arguments: score);
      }
      print(randomItem['number']);
      randomItem = (selectcolors.toList()..shuffle()).first;
      selectcolors = (selectcolors.toList()..shuffle());
    });
  }

  doNothing() {}

  gameover() {
    setState(() {
      isStarted = false;
    });
  }

  var selectcolors = [
    {"color": Colors.pink, "number": 1},
    {"color": Colors.amber, "number": 2},
    {"color": Colors.blue, "number": 3},
    {"color": Colors.green, "number": 4},
    {"color": Colors.brown, "number": 5},
    {"color": Colors.purple, "number": 6},
    {"color": Colors.pink, "number": 1},
    {"color": Colors.amber, "number": 2},
    {"color": Colors.blue, "number": 3},
    {"color": Colors.green, "number": 4},
    {"color": Colors.brown, "number": 5},
    {"color": Colors.purple, "number": 6},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            isStarted
                ? Container()
                : Container(
                    height: 200,
                  ),
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Quick Pick',
                style: TextStyle(
                    fontSize: 40, fontFamily: 'Baloo2', color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
            isStarted
                ? Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Time : $time Sec',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Baloo2',
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Score : $score',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Baloo2',
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    height: 41,
                  ),
            isStarted
                ? Expanded(
                    child: Container(
                      child: GridView(
                        padding: const EdgeInsets.all(10),
                        children: selectcolors
                            .map(
                              (cards) => ColorCard(
                                  cards["color"], cards["number"], cardTapped),
                            )
                            .toList(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 75,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15),
                      ),
                    ),
                  )
                : Container(),
            isStarted
                ? Container(
                    height: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 50, left: 0),
                                child: Text(
                                  'Pick',
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 25),
                          height: 100,
                          width: 100,
                          child: ColorCard(randomItem['color'],
                              randomItem['number'], doNothing),
                        ),
                      ],
                    ),
                  )
                : Container(),
            isStarted
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      child: InkWell(
                        splashColor: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          setState(() {
                            isStarted = !isStarted;
                          });
                          timer();
                        },
                        child: Container(
                          height: 70,
                          width: 200,
                          child: Center(
                            child: Text(
                              'Start',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
