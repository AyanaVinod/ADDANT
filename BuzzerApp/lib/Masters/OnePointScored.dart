import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class OnePointScored extends StatefulWidget {
  OnePointScored({super.key});
  @override
  _OnePointScored createState() => _OnePointScored();
}

class _OnePointScored extends State<OnePointScored> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gamePopColor,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _firstContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _firstContainer(BuildContext context) {
  return Container(
      alignment: Alignment.topCenter,
      // transform: Matrix4.translationValues(0, -200, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/ic_pattern_top.png',
            width: 600,
            fit: BoxFit.fill,
          ),
          Container(
            // transform: Matrix4.translationValues(0, -150, 0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Text(
                      'Congrats!',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 4,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = textYellow,
                      ),
                    ),
                    const Text(
                      'Congrats!',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 4,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: gamePopColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Text(
                      'you got 1 point',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.white,
                      ),
                    ),
                    const Text(
                      'you got 1 point',
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 2,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                        color: gamePopColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Image.asset('assets/images/ic_scored_one.png')
        ],
      ));
}
