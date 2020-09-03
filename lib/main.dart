import 'package:colors/screens/game_over.dart';
import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';

import './screens/game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colors',
      theme: ThemeData(fontFamily: 'Baloo2'),
      home: GameScreen(),
      routes: {
        GameOver.routeName: (ctx) => GameOver(),
        'game': (ctx) => GameScreen()
      },
    );
  }
}

// class Splachscreen extends StatefulWidget {
//   @override
//   _SplachscreenState createState() => _SplachscreenState();
// }

// class _SplachscreenState extends State<Splachscreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => GameScreen(),
//           ));
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FlareActor("assets/idle.flr",
//           alignment: Alignment.center, fit: BoxFit.contain, animation: "Idle"),
//     );
//   }
// }
