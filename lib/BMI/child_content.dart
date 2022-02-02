import 'package:flutter/material.dart';
import 'package:jisan/BMI/constants.dart';

class childContent extends StatelessWidget {
 const childContent({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(height: 15),
        Text(label, style: KlabelTextStyle)
      ],
    );
  }
}
