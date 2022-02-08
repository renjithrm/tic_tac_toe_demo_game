// ignore_for_file: prefer_const_constructors, prefer_const_declarations, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:game/controller/home_controller.dart';
import 'package:game/helper/helper.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(106, 32, 30, 30),
      body: GetBuilder<HomeController>(
        id: "game",
        init: HomeController(),
        builder: (_) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: Helper.builder(homeController.metrixBox,
                  (index, model) => rowBuilder(index)),
            ),
          );
        },
      ),
    );
  }

  Widget rowBuilder(int number) {
    final value = homeController.metrixBox[number];
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            Helper.builder(value, (y, model) => buttonBuilder(number, y)));
  }

  Widget buttonBuilder(int x, int y) {
    final value = homeController.metrixBox[x][y];
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(homeController.boxSize, homeController.boxSize),
            primary: Color.fromARGB(255, 3, 85, 122),
          ),
          onPressed: () {
            homeController.selectButton(
              value,
              x,
              y,
              homeController.metrixBox,
              homeController.metrixCount,
            );
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
}
