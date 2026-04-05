import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LudoApp());
}

class LudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LudoHome(),
    );
  }
}

class LudoHome extends StatefulWidget {
  @override
  _LudoHomeState createState() => _LudoHomeState();
}

class _LudoHomeState extends State<LudoHome> {
  int diceNumber = 1;
  String currentPlayer = "Red";

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;

      List players = ["Red", "Green", "Yellow", "Blue"];
      int index = players.indexOf(currentPlayer);
      currentPlayer = players[(index + 1) % 4];
    });
  }

  Widget buildPlayerBox(Color color) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "HOME",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildBoard() {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        buildPlayerBox(Colors.red),
        Container(color: Colors.white),
        buildPlayerBox(Colors.green),
        Container(color: Colors.white),
        Center(
          child: Text(
            "$diceNumber",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Container(color: Colors.white),
        buildPlayerBox(Colors.yellow),
        Container(color: Colors.white),
        buildPlayerBox(Colors.blue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ludo Frontend"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Turn: $currentPlayer",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(child: buildBoard()),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: rollDice,
            child: Text("Roll Dice 🎲"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}