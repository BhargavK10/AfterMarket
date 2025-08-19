import 'package:aftermarket/drawermenu.dart';
import 'package:aftermarket/screens/product_page.dart';
import 'package:aftermarket/titlebar.dart';
import 'package:aftermarket/toppicksslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  Container carCard(String image, String name, String mods) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 20, bottom: 10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Color(0xFFD7D7D7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 200),
          Text(
            '$name\n$mods mods',
            style: TextStyle(
              color: Color(0xFF242424),
              fontFamily: 'Rajdhani',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox categoryButton(Icon buttonIcon, String buttonText, Widget toPage){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.47,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2C3137),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10)
          )
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toPage),
          );
        },
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Row(
            children: [
              buttonIcon,
              SizedBox(width: 10),
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rajdhani',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showExitDialog(BuildContext context) async {
    final shouldQuit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Quit App'),
        content: Text('Are you sure you want to quit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // No
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Yes
            child: Text('Yes'),
          ),
        ],
      ),
    );
    if (shouldQuit == true) {
      // For Android/iOS, quit the app
      // exit(0);
      SystemNavigator.pop();
    }
    // Otherwise, dialog simply closes
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default pop action
      onPopInvoked: (didPop) {
        if (!didPop) {
          _showExitDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: titleBar(),
        drawer: DrawerMenu(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //search v
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: const Color(0xFFDB3939),
                  decoration: InputDecoration(
                    hintText: 'Find just what fits your ride',
                    hintStyle: const TextStyle(color: Color(0xFFA9A8A8)),
                    prefixIcon: Icon(Icons.search, color: const Color(0xFFDB3939)),
                    filled: true,
                    fillColor: const Color(0xFFD7D7D7),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFDB3939)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFD7D7D7)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (value) {
                    // Navigate to product page with search text
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(searchText: value,),
                      ),
                    );
                  },
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
                        color: Color(0xFF242424),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Row(
                  children: [
                    Column(
                      children: [
                        categoryButton(Icon(Icons.build, color: Colors.white,), 'Performance', ProductPage(category: "performance")),
                        SizedBox(height: 10),
                        categoryButton(Icon(Icons.shopping_bag, color: Colors.white,), 'OEM', ProductPage(category: "oem")),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Column(
                      children: [
                        categoryButton(Icon(Icons.auto_awesome, color: Colors.white,), 'Asthetic', ProductPage(category: "asthetic",)),
                        SizedBox(height: 10),
                        categoryButton(Icon(Icons.car_repair, color: Colors.white,), 'Body Kits', ProductPage(category: "bodykits")),
                      ],
                    ),
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
                        color: Color(0xFF242424),
                      ),
                    ),
                  ),
                ],
              ),
              carCard('assets/images/cars/BMW_E36.png', 'BMW E36 M3', '3'),
              carCard('assets/images/cars/Nissan_S13.png', 'Nissan S13', '6'),
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 20,
                  bottom: 10,
                  top: 10,
                ),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFDB3939),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Color(0xFFE0E0E0)),
                    Text(
                      'Add car',
                      style: TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontFamily: 'Rajdhani',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //your cars ^
            ],
          ),
        ),
      ),
    );
  }
}