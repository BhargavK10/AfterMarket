import 'package:flutter/material.dart';

// class DrawerMenu extends StatelessWidget {
//   const DrawerMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       surfaceTintColor: Color(0xFFF8F9FA),
//         child: ListView(
//           padding: EdgeInsets.all(0),
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//               ),
//               child: UserAccountsDrawerHeader(
//                 accountName: Text('NAME HERE'), 
//                 accountEmail: Text('EmailHere'),
//                 currentAccountPictureSize: Size.square(50),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundColor: Colors.black,
//                   child: Image.asset('assets/images/911.jpg')
//                 ),
//               )
//             ),
//             Divider(),
//             ListTile(
//               title: Text('data'),
//               leading: Icon(Icons.home),
//               onTap: (){
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         ),
//     );
//   }
// }


class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(10),
        ),
      ),
      backgroundColor: Color(0xFFD7D7D7),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF2C3137),
            ),
            child: Image.asset('assets/images/logos/Logo_mini2_white.png'),
            // child: Row(
            //   children: [
            //     Icon(
            //       Icons.directions_car,
            //       color: Colors.redAccent,
            //       size: 36,
            //     ),
            //     SizedBox(width: 12),
            //     Text(
            //       'AFTERMARKET',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 22,
            //         fontWeight: FontWeight.w700,
            //         letterSpacing: 2,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: const Color(0xFF242424)),
            title: Text('Home', style: TextStyle(color: Color(0xFF242424))),
            onTap: () {
              Navigator.pop(context);
              // Use your page navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.build, color: Color(0xFF242424)),
            title: Text('Performance', style: TextStyle(color: Color(0xFF242424))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.auto_awesome, color: Color(0xFF242424)),
            title: Text('Aesthetic', style: TextStyle(color: Color(0xFF242424))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Color(0xFF242424)),
            title: Text('OEM Parts', style: TextStyle(color: Color(0xFF242424))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.car_repair, color: Color(0xFF242424)),
            title: Text('Body Kits', style: TextStyle(color: Color(0xFF242424))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(color: Colors.grey[700]),
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFF242424)),
            title: Text('Profile', style: TextStyle(color: Color(0xFF242424))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: const Color(0xFFDB3939)),
            title: Text('Logout', style: TextStyle(color: Color(0xFFDB3939))),
            onTap: () {
              Navigator.pop(context);
              // Add your logout action
            },
          ),
        ],
      ),
    );
  }
}