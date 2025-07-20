import 'package:aftermarket/drawermenu.dart';
import 'package:aftermarket/titlebar.dart';
import 'package:aftermarket/toppicksslider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Container carCard(String image, String name, String mods){
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20, bottom: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Color(0xFFD7D7D7),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 200,
          ),
          Text(
            '$name\n$mods mods',
            style: TextStyle(
              color: Color(0xFF242424),
              fontFamily: 'Rajdhani',
              fontSize: 20
            ),
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
            //search v
            Container(
              padding: EdgeInsets.only(left: 10, right: 20, bottom: 10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFD7D7D7)
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color(0xFFDB3939),),
                    SizedBox(width: 5,),
                    Text(
                      'Find just what fits your ride',
                      style: TextStyle(
                        color: Color(0xFFA9A8A8)
                      ),
                    )
                  ],
                )
              ),
            ),
            // search ^
            // top picks v
           Container(
              // padding: EdgeInsets.only(left: 10, right: 20, bottom: 10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TopPicksSlider(),
            ),
            // top picks ^
            // categories v
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Categories',
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
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xFF2C3137),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/performance.png',
                              height: 80,
                            ),
                            Text(
                              'Performace',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Rajdhani',
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xFF2C3137),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/asthetic.png',
                              height: 80,
                            ),
                            Text(
                              'Asthetic',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Rajdhani',
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    children: [
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xFF2C3137),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/OEM.png',
                              height: 80,
                            ),
                            Text(
                              'OEM',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Rajdhani',
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Color(0xFF2C3137),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icons/bodykit.png',
                              height: 80,
                            ),
                            Text(
                              'Body Kits',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Rajdhani',
                                fontSize: 18
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // categories ^
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            //your cars v
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Your cars',
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
            carCard('assets/images/cars/BMW_E36.png', 'BMW E36 M3', '3'),
            carCard('assets/images/cars/Nissan_S13.png', 'Nissan S13', '6'),
            Container(
              padding: EdgeInsets.only(left: 10, right: 20, bottom: 10, top: 10),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: Color(0xFFDB3939),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: Color(0xFFE0E0E0),),
                  Text(
                    'Add car',
                    style: TextStyle(
                      color: Color(0xFFE0E0E0),
                      fontFamily: 'Rajdhani',
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            //your cars ^
          ],
        ),
      ),
    );
  }
}