import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopPicksSlider extends StatelessWidget {
  const TopPicksSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imgList = [
      {
        "img": 'assets/images/parts/exhaust.jpg',
        "title": 'Performance Exhaust',
        "desc": 'Enhance sound and horsepower with this high-flow exhaust system.',
      },
      {
        "img": 'assets/images/parts/cold_air_intake.jpg',
        "title": 'Cold Air Intake',
        "desc": 'Boost throttle response and power with improved airflow.',
      },
      {
        "img": 'assets/images/parts/spoiler.png',
        "title": 'Carbon Fiber Spoiler',
        "desc": 'Add aggressive style and better aerodynamics.',
      },
      {
        "img": 'assets/images/parts/wheels.png',
        "title": 'Forged Wheels',
        "desc": 'Stronger and lighter wheels for better performance.',
      },
    ];
    return CarouselSlider(
      items: imgList.map((item){
        return Stack(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(item['img']!, fit: BoxFit.cover,),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withAlpha(127)
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text(
                        item['title']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rajdhani'
                        ),
                      ),
                    ]
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      item['desc']!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rajdhani'
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDB3939),
                          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: 10,
                          //   // vertical: 10
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(50)
                          )
                        ),
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:Text('Button clicked'))
                          );
                        },
                        child: Text('view'),
                      ),
                      SizedBox(width: 10,)
                    ]
                  )
                ],
              ),
            )
          ]
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: true
       )
    );
  }
}