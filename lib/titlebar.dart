import 'package:flutter/material.dart';

PreferredSizeWidget titleBar(String title){
  return AppBar(
    backgroundColor: Color(0xFF2A2D34),
    title: Center(
      child: Image.asset(
        'assets/images/FullLogoWhite.png',
        height: 100,
      ),
    )
  );
}