import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  final Color cardColor;
  final int number;
  final Function tapped;
  ColorCard(this.cardColor, this.number, this.tapped);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: cardColor.withOpacity(.9),
      child: InkWell(
        splashColor: Colors.white,
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          tapped(number);
        },
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
