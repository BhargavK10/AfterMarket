import 'package:aftermarket/drawermenu.dart';
import 'package:aftermarket/titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Your cars:',
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
            
          ],
        ),
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       backgroundColor: Color(0xFFDCDBD6),
//       appBar: titleBar('HelloThere'),
//       drawer: DrawerMenu(),
//       body: Center(
//         child: Container(
          
//         ),
//       ),
//     );
//   }
// }