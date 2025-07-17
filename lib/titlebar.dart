import 'package:flutter/material.dart';

PreferredSizeWidget titleBar(){
  return AppBar(
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    backgroundColor: Color(0xFF2C3137),
    title: Center(
      child: Image.asset(
        'assets/images/logos/FullLogoWhite.png',
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