// import 'package:aftermarket/providers/product_provider.dart';
// import 'package:aftermarket/screens/description_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/product.dart';
// import '../providers/cart_provider.dart';
// import 'cart_page.dart';

// class ProductPage extends StatelessWidget {
//   final List<Product> products =[
//    Product(name: "911", price: 600.90, image: 'assets/images/logos/Logo_max.png', id: '1234', description: "usajnfoiafjdonfkoflksdflkdslkfdslkfd"),
//    Product(name: "718", price: 99.99, image: 'assets/images/logos/Logo_mini.png', id: '1235', description: "usajnfoiafjdonfkoflksdflkdslkfdslkfd"),
//    Product(name: "Taycan", price: 39.99, image: 'assets/images/logos/Logo_mini2.png', id: '1236', description: "usajnfoiafjdonfkoflksdflkdslkfdslkfd")
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final cart= Provider.of<CartProvider>(context,listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: Color(0xFF2C3137),
//         title: Text('Products'),
//         actions: [
//           Stack(
//             children: [
//               IconButton(
//                 onPressed:(){
//                   Navigator.push(context, MaterialPageRoute(
//                     builder:(_)=>CartPage() ),
//                   );
//                 },
//                 icon: Icon(Icons.shopping_cart),
//               ),
//               Positioned(
//                 child: Consumer<CartProvider>(
//                   builder: (_, CartProvider, __)=>
//                   CircleAvatar(
//                     radius: 10,
//                     backgroundColor: Colors.red,
//                     child: Text(
//                       CartProvider.itemCount.toString(),
//                       style: TextStyle(
//                         fontSize: 12,color: Colors.white
//                       ),
//                     ),
//                   )
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (cntext, index) {
//           final product = products[index];
//           return Card(
//             color: Color(0xFFEFEFEF),
//             child: ListTile(
//               leading: Image.asset(product.image),
//               title: Text(product.name),
//               subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
//               onTap: () {
//                 context.read<ProductProvider>().selectProduct(product);
//                 Navigator.push(context, MaterialPageRoute(
//                   builder: (context)=> const DescriptionPage(),
//                 ));
//               },
//               trailing: ElevatedButton(
//                 onPressed: (){
//                   cart.addToCart(product);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("${product.name} added to your cart"))
//                   );
//                 },
//                  child: Text("Add To Cart")
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:aftermarket/providers/product_provider.dart';
import 'package:aftermarket/screens/product_description_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductPage extends StatefulWidget {
  final String category;
  const ProductPage({Key? key, required this.category}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProducts() async {
    final response = await Supabase.instance.client
        .from('products')
        .select()
        .eq('category', widget.category);

    // Supabase always returns a List<dynamic>
    final data = response as List<dynamic>;

    return data.map((json) => Product.fromJson(json)).toList();
  }

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final fetched = await fetchProducts();
    setState(() {
      products = fetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2C3137),
        title: const Text('Products'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CartPage()),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Consumer<CartProvider>(
                  builder: (_, cartProvider, __) => CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartProvider.itemCount.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 products per row
          childAspectRatio: 3 / 4, // adjust card height/width ratio
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: const Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                context.read<ProductProvider>().selectProduct(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DescriptionPage(
                      product: product,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.network(product.images[0], fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text("\$${product.price.toStringAsFixed(2)}"),
                    ElevatedButton(
                      onPressed: () {
                        cart.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to your cart"),
                          ),
                        );
                      },
                      child: const Text("Add To Cart"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
