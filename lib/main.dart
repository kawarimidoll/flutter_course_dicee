import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  List<int> dices = [1, 2];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: dices.asMap().entries.map((e) => diceWidget(e.key)).toList(),
      ),
    );
  }

  Widget diceWidget(index) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() => changeDiceFace());
          print('Dice #$index got pressed!');
        },
        child: Image.asset('images/dice${dices[index]}.png'),
      ),
    );
  }

  void changeDiceFace() {
    dices = getDices(dices.length);
    print(dices);
  }

  List<int> getDices(int length) {
    return List.filled(length, 0).map((e) => Random().nextInt(6) + 1).toList();
  }
}
