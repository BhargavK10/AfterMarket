// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';
// import 'cart_page.dart';

// class ProductPage extends StatelessWidget {
// final List<Product> products = [
//   Product(name: "Exhaust", price: 99.99),
//   Product(name: "AirIntake", price: 59.99),
//   Product(name: "turbocharger", price: 199.99),
// ];

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('products'),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
//                 },
//                 icon: Icon(Icons.shopping_cart)
//               ),
//               Positioned(
//                 right: 6,
//                 left: 6,
//                 child: Consumer(builder: (_, CartProvider, __) =>
//                   CircleAvatar(
//                     radius: 10,
//                     backgroundColor: Colors.redAccent,
//                     child: Text(
//                       CartProvider!.itemCount.toString(),
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white
//                       ),
//                     ),
//                   )
//                 )
//               )
//             ],
//           )
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (_, index){
//           final product = products[index];
//           return Card(
//             child: ListTile(
//               title: Text(product.name),
//               subtitle: Text("{product.price}"),
//               trailing: ElevatedButton(
//                 onPressed: (){
//                   cart.addToCart(product);
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('${product.name} added to your cart')
//                   ));
//                 },
//                 child: Text('Add to cart')
//               ),
//             ),
//           );
//         }
//       ),
//     );
//   }
// }

import 'package:aftermarket/providers/product_provider.dart';
import 'package:aftermarket/screens/description_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_page.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products =[
   Product(name: "911", price: 600.90, image: 'assets/images/logos/Logo_max.png', id: '1234', description: "usajnfoiafjdonfkoflksdflkdslkfdslkfd"),
   Product(name: "718", price: 99.99, image: 'assets/images/logos/Logo_mini.png', id: '1235', description: "usajnfoiafjdonfkoflksdflkdslkfdslkfd"),
   Product(name: "Taycan", price: 39.99, image: 'assets/images/logos/Logo_mini2.png', id: '1236', description: "usajnfoiafjdonfkoflksdflkdslkfdslkfd")
  ];

  @override
  Widget build(BuildContext context) {
    final cart= Provider.of<CartProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
           title: Text('Products'),
           actions: [
            Stack(
              children: [
                IconButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(
                      builder:(_)=>CartPage() ),
                      );
                  },
                 icon: Icon(Icons.shopping_cart),
                 ),
                 Positioned(
                  child: Consumer<CartProvider>(
                    builder: (_, CartProvider, __)=>
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        CartProvider.itemCount.toString(),
                        style: TextStyle(
                          fontSize: 12,color: Colors.white
                        ),
                      ),
                    )
                    ),
                  ),
              ],
            ),
           ],

      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (cntext, index) {
          final product = products[index];
          return Card(
              child: ListTile(
                leading: Image.asset(product.image),
                title: Text(product.name),
                subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                onTap: () {
                  context.read<ProductProvider>().selectProduct(product);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> const DescriptionPage(),
                  ));
                },
                trailing: ElevatedButton(
                  onPressed: (){
                    cart.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${product.name} added to your cart"))
                    );
                  },
                   child: Text("Add To Cart")
                ),
              ),
          );
        },
      ),
    );
  }
}