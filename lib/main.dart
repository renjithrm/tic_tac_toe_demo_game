import 'package:flutter/material.dart';
import 'package:game/view/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
