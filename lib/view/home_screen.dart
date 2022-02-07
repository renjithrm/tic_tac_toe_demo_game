// ignore_for_file: prefer_const_constructors, prefer_const_declarations, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:game/constant/players.dart';
import 'package:game/helper/helper.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final metrixCount = 3;
  static final double boxSize = 93.0;
  late List<List<String>> metrixBox;
  String lastMove = Players.noPlayer;
  @override
  void initState() {
    setMetrixBox();
    super.initState();
  }

  setMetrixBox() => setState(() => metrixBox = List.generate(metrixCount,
      (index) => List.generate(metrixCount, (index) => Players.noPlayer)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(106, 32, 30, 30),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
              Helper.builder(metrixBox, (index, model) => rowBuilder(index)),
        ),
      ),
    );
  }

  Widget rowBuilder(int number) {
    final value = metrixBox[number];
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            Helper.builder(value, (y, model) => buttonBuilder(number, y)));
  }

  Widget buttonBuilder(int x, int y) {
    final value = metrixBox[x][y];
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(boxSize, boxSize),
            primary: Color.fromARGB(255, 3, 85, 122),
          ),
          onPressed: () {
            selectButton(value, x, y);
          },
          child: Text(
            value,
            style: TextStyle(
              color: value == "X"
                  ? Color.fromARGB(255, 233, 25, 10)
                  : Color.fromARGB(255, 3, 250, 12),
              fontSize: 32,
            ),
          )),
    );
  }

  selectButton(String value, int x, int y) {
    if (value == Players.noPlayer) {
      final newValue = lastMove == Players.O ? Players.X : Players.O;
      setState(() {
        lastMove = newValue;
        metrixBox[x][y] = newValue;
      });
      if (Helper.isWinner(x, y, metrixBox, metrixCount)) {
        dailogBox("Player Won", "$lastMove won the game...");
      } else if (metrixBox.every((element) =>
          element.every((element) => element != Players.noPlayer))) {
        dailogBox("Undecided Game", "Press restart...");
      }
    }
  }

  dailogBox(String title, String midText) {
    Get.defaultDialog(title: title, middleText: midText, actions: [
      ElevatedButton(
          onPressed: () {
            setMetrixBox();
            Get.back();
          },
          child: Text("Restart")),
    ]);
  }
}
