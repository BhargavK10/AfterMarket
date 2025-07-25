// import 'package:aftermarket/models/product.dart';
import 'package:aftermarket/providers/cart_provider.dart';
import 'package:aftermarket/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductProvider>().selectedProduct;
    if(product == null){
      return Scaffold(
        body: Center(
          child: Text('No product selected'),
        ),
      );
    }
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Description page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 18
              ),
            ),
            Text(
              "price: \$${product.price}",
              style: TextStyle(
                fontSize: 18
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                cartProvider.addToCart(product);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to cart')
                ));
              },
              child: Text('add to cart')
            )
          ],
        ),
      ),
    );
  }
}