import 'package:flutter/material.dart';

PreferredSizeWidget titleBar(){
  return AppBar(
    iconTheme: IconThemeData(color: Color(0xFF242424)),
    backgroundColor: Color(0xFFD7D7D7),
    title: Center(
      child: Image.asset(
        'assets/images/FullLogoBlack.png',
        height: 200,
      ),
    ),
    actions: [
      IconButton(
        onPressed: (){}, icon: Icon(Icons.person_outline),
        iconSize: 40,
      )
    ],
  );
}