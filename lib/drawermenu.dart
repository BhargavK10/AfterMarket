import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: Color(0xFFF8F9FA),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: UserAccountsDrawerHeader(
                accountName: Text('NAME HERE'), 
                accountEmail: Text('EmailHere'),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Image.asset('assets/images/911.jpg')
                ),
              )
            ),
            Divider(),
            ListTile(
              title: Text('data'),
              leading: Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
    );
  }
}