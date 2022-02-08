import 'package:flutter/material.dart';
import 'package:game/controller/home_controller.dart';
import 'package:get/get.dart';

dailogBox(String title, String midText, List<List<String>> metrixBox,
    int metrixCount) {
  Get.defaultDialog(title: title, middleText: midText, actions: [
    ElevatedButton(
        onPressed: () {
          Get.find<HomeController>().setMetrixBox();
          Get.back();
        },
        child: Text("Restart")),
  ]);
}
