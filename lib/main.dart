import 'package:aftermarket/homepage.dart';
import 'package:aftermarket/performanceproducts.dart';
import 'package:aftermarket/login.dart';
import 'package:aftermarket/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}