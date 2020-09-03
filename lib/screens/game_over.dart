import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  static const routeName = 'GameOver';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 400),
                child: Text(
                  'Score : ${args}',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Container(
                child: Text(
                  'Game Over',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 100,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  child: InkWell(
                    splashColor: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('game', (route) => false);
                    },
                    child: Container(
                      height: 70,
                      width: 200,
                      child: Center(
                        child: Text(
                          'Play Again',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
