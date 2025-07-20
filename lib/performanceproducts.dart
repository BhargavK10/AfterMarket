import 'package:aftermarket/drawermenu.dart';
import 'package:aftermarket/titlebar.dart';
import 'package:flutter/material.dart';

class PerformanceProducts extends StatelessWidget {
  const PerformanceProducts({super.key});

  Container productCard(String img, String name, String compatiblity, String price){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD7D7D7),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            height: 150,
            width: 180,
            child:ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(
                img,
                fit: BoxFit.fill,
              ),
            )
          ),
          SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$name\n$compatiblity'),
                Text(price),
              ],
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: titleBar(),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Products',
                    style: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color(0xFF242424)
                    ),
                  ),
                )
              ]
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('assets/images/parts/Borla_E36.png', 'name', 'compatiblity', 'price'),
                productCard('assets/images/parts/S13_turbo.png', 'name', 'compatiblity', 'price'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('assets/images/parts/Borla_E36.png', 'name', 'compatiblity', 'price'),
                productCard('assets/images/parts/S13_turbo.png', 'name', 'compatiblity', 'price'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('assets/images/parts/Borla_E36.png', 'name', 'compatiblity', 'price'),
                productCard('assets/images/parts/S13_turbo.png', 'name', 'compatiblity', 'price'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('assets/images/parts/Borla_E36.png', 'name', 'compatiblity', 'price'),
                productCard('assets/images/parts/S13_turbo.png', 'name', 'compatiblity', 'price'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('assets/images/parts/Borla_E36.png', 'name', 'compatiblity', 'price'),
                productCard('assets/images/parts/S13_turbo.png', 'name', 'compatiblity', 'price'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                productCard('assets/images/parts/Borla_E36.png', 'name', 'compatiblity', 'price'),
                productCard('assets/images/parts/S13_turbo.png', 'name', 'compatiblity', 'price'),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}