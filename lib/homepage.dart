import 'package:aftermarket/titlebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar('HelloThere'),
      body: Center(
        child: Container(
          
        ),
      ),
    );
  }
}