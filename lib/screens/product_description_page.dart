// // import 'package:aftermarket/models/product.dart';
// import 'package:aftermarket/providers/cart_provider.dart';
// import 'package:aftermarket/providers/product_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DescriptionPage extends StatelessWidget {
//   const DescriptionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final product = context.watch<ProductProvider>().selectedProduct;
//     if(product == null){
//       return Scaffold(
//         body: Center(
//           child: Text('No product selected'),
//         ),
//       );
//     }
//     final cartProvider = context.watch<CartProvider>();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Description page"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               product.name,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24
//               ),
//             ),
//             Text(
//               product.description,
//               style: TextStyle(
//                 fontSize: 18
//               ),
//             ),
//             Text(
//               "price: \$${product.price}",
//               style: TextStyle(
//                 fontSize: 18
//               ),
//             ),
//             SizedBox(height: 20,),
//             ElevatedButton(
//               onPressed: (){
//                 cartProvider.addToCart(product);
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Added to cart')
//                 ));
//               },
//               child: Text('add to cart')
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DescriptionPage extends StatelessWidget {
  final String productName;
  final List<String> productImages;
  final String description;
  final String technicalInfo;
  final List<String> reviews;

  const DescriptionPage({
    super.key,
    required this.productName,
    required this.productImages,
    required this.description,
    required this.technicalInfo,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        title: Text(
          productName,
          style: const TextStyle(
            fontFamily: 'Rajdhani',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF2C3137),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
              items: productImages.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDB3939),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        // Order Now logic
                      },
                      child: const Text(
                        "Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Rajdhani',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFD7D7D7)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        // Add to Cart logic
                      },
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Rajdhani',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Description
            _sectionTitle("Description"),
            _sectionContent(description),

            // Technical Info
            _sectionTitle("Technical Info"),
            _sectionContent(technicalInfo),

            // Reviews
            _sectionTitle("Reviews"),
            ...reviews.map((review) => _reviewCard(review)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: 'Rajdhani',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _sectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(179, 0, 0, 0),
          fontFamily: 'Rajdhani',
        ),
      ),
    );
  }

  Widget _reviewCard(String review) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        color: const Color(0xFFD7D7D7),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            review,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Rajdhani',
            ),
          ),
        ),
      ),
    );
  }
}
