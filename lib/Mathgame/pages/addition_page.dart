import 'package:jisan/Mathgame/widgets/game.dart';
import 'package:flutter/material.dart';
import 'package:jisan/Mathgame/constants/app_constant.dart';

class ToplamaOyunu extends StatefulWidget {
  const ToplamaOyunu({Key? key}) : super(key: key);

  @override
  _ToplamaOyunuState createState() => _ToplamaOyunuState();
}

class _ToplamaOyunuState extends State<ToplamaOyunu> {
  final int _highScore = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        backgroundColor: Colors.indigoAccent,
        title: const Text(
          "যোগ কুইজ",
        ),
      ),
      body: GameArea(
        color: Sabitler.plusGameColor,
        keyScore: "plus",
        score: _highScore,
        gameOperator: "+",
      ),
    );
  }
}
